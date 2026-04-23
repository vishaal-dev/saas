# Flutter web performance playbook

Use this checklist when optimizing another Flutter web repo. It mirrors patterns applied in this project: smaller assets, faster decode, fewer repaints, resilient startup, static hosting headers, and Docker-based deploy when PaaS auto-build fails.

---

## 1. Images

### Prefer WebP for large raster screenshots

- Convert heavy PNG/JPEG to WebP (quality ~80–85) with Pillow, `cwebp`, or your CI.
- Update all `Image.asset` / precache paths to `.webp`.
- Keep originals in git only if you need lossless source; otherwise ship WebP only to reduce bundle size.

**Typical savings:** 40–85% smaller than PNG for UI screenshots.

### Downscale at decode time

Use `cacheWidth` (and optionally `cacheHeight`) on `Image.asset` so Flutter decodes closer to on-screen size:

```dart
Image.asset(
  path,
  fit: BoxFit.cover, // or contain, as needed
  cacheWidth: isFront ? 1500 : 1100, // tune per breakpoint / card size
  filterQuality: isFront ? FilterQuality.high : FilterQuality.medium,
);
```

Adjust numbers from your layout (smaller cards → lower `cacheWidth`).

---

## 2. Preload critical assets

After first frame, precache images the user sees immediately (hero, logos, preview stack):

```dart
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!mounted) return;
    for (final path in const [
      'assets/images/logo.png',
      'assets/images/hero.webp',
    ]) {
      precacheImage(AssetImage(path), context);
    }
  });
}
```

List only truly above-the-fold assets to avoid extra work.

---

## 3. Repaint isolation for heavy widgets

Wrap expensive subtrees (stacked previews, charts, blur layers) in `RepaintBoundary` so scrolling and parent animations don’t repaint the whole subtree every frame.

```dart
RepaintBoundary(
  child: YourHeavyPreviewWidget(),
)
```

---

## 4. Startup path (`main.dart`)

- Add **timeouts** around slow async init (network, remote config) so a hung call doesn’t block first paint forever.
- On **web**, consider failing open: if init errors, still show the app when safe (product decision).

Example pattern:

```dart
await initializeApp().timeout(const Duration(seconds: 8));
await networkChecker.getConnectionStatus().timeout(
  const Duration(seconds: 2),
  onTimeout: () => <ConnectivityResult>[],
);
await appSettingsController.initializeSettings().timeout(
  const Duration(seconds: 5),
  onTimeout: () {},
);
```

Use `kIsWeb` to branch stricter offline handling on mobile vs web.

---

## 5. `web/index.html`

- **Viewport:** add for correct mobile scaling:

  ```html
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
  ```

- **Preload** critical static assets (paths must match `pubspec` assets and build output):

  ```html
  <link rel="preload" as="image" href="assets/images/hero.webp" type="image/webp" fetchpriority="high">
  ```

- Optional: minimal **inline boot UI** (spinner + background) so users see feedback before Flutter loads.

---

## 6. Static hosting cache headers

### Netlify / similar: `web/_headers`

Example rules (tune to your host’s syntax):

- Short cache / revalidate: `index.html`, `flutter_bootstrap.js`, service worker.
- Long cache + immutable: hashed JS, `/assets/*`.

Copy `web/_headers` into `build/web` in CI after `flutter build web` if your host reads headers from the publish directory.

### Caddy / reverse proxy

If you serve `build/web` with Caddy/Nginx:

- `encode zstd gzip`
- Long `Cache-Control` for static assets; `must-revalidate` for HTML and bootstrap scripts.
- SPA fallback: `try_files {path} /index.html`

---

## 7. Release build command (CI-safe)

Use flags supported by **your** Flutter version (`flutter build web -h`). Avoid copying flags from older docs if CLI rejects them.

Baseline pattern:

```bash
flutter pub get
flutter build web \
  --release \
  --base-href "/" \
  --optimization-level=4 \
  --no-source-maps \
  --dart-define=ENVIRONMENT=production
```

Add PWA/offline only if supported:

```bash
--pwa-strategy=offline-first
```

**Do not** add `--web-renderer` unless `flutter build web -h` lists it for your SDK. This repo intentionally omits it: older/newer Flutter versions differ, and builds failed with *Could not find an option named '--web-renderer'*. Default renderer is fine for production; only set it when your CLI documents the flag.

---

## 8. Railway / Docker (when Railpack can’t detect Flutter)

- Provide a **Dockerfile** that:
  - **Build stage:** install Flutter, `pub get`, `flutter build web`.
  - **Runtime stage:** serve `build/web` with Caddy (or nginx) on `$PORT`.
- Add `railway.toml` with `builder = "DOCKERFILE"` and `startCommand` for your server.

This avoids “could not determine how to build” and missing `start.sh` errors.

---

## 9. Quick verification

- `flutter analyze` clean.
- Local: `flutter build web` then serve `build/web` (e.g. `python -m http.server`) and check Network tab: WebP served, reasonable transfer sizes.
- Lighthouse (Chrome): LCP, TBT, CLS on landing route.

---

## 10. Copy to another repo

1. Add/adjust assets (WebP) and paths.
2. Add precache lists + `cacheWidth` where images are large.
3. Add `RepaintBoundary` around heavy custom painters / stacks / blur.
4. Harden `main.dart` with timeouts + web-friendly fallbacks.
5. Update `web/index.html` (viewport + preload + optional boot UI).
6. Add `web/_headers` or server config; wire CI to copy `_headers` into `build/web` if needed.
7. Align `flutter build web` flags with your Flutter version; fix CI and Dockerfiles together.

---

*Generated from performance work on this codebase; adapt paths and numbers per project.*
