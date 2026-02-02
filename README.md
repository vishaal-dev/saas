# saas

A Flutter application (mobile + web).

## Getting Started

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/)

---

## Deploying the web app to GitHub Pages (show app, not README)

GitHub Pages will show your **Flutter app** (e.g. login screen) only if it serves the **built** app from the **`gh-pages`** branch. Follow this checklist exactly.

### Checklist (do in order)

| # | What to do | Where |
|---|------------|--------|
| 1 | **Set Pages source to `gh-pages`** (do this first so the branch is selected) | Repo **Settings** → **Pages** → **Build and deployment** → **Source**: **Deploy from a branch** → **Branch**: **gh-pages** → **/ (root)** → **Save** |
| 2 | **Run the deploy workflow** | **Actions** tab → **Deploy to GitHub Pages** → **Run workflow** → wait until it finishes (green check). Or push to `main`/`master`. |
| 3 | **Open the app URL (with trailing slash)** | **`https://<your-username>.github.io/<repo-name>/`** — e.g. `https://vishal.github.io/saas/` |

### Still seeing README?

- **You must use the app URL with a trailing slash:**  
  `https://<username>.github.io/saas/`  
  If you open `https://github.com/.../saas` or the root without `/saas/`, you will see the repo or README, not the app.

- **Pages must be set to the `gh-pages` branch.**  
  If **Source** is "Deploy from a branch" but the branch is **main** (or anything other than **gh-pages**), the site will show the repo (README). Change it to **gh-pages** and **/ (root)** and Save.

- **First deployment:**  
  Sometimes the first push to `gh-pages` needs the branch to already be selected in Settings → Pages. Do **Step 1** above first, then run the workflow again.

- **Wait 1–2 minutes** after the workflow succeeds; GitHub Pages can take a moment to update.

### How it works

- **`web/index.html`** is a template (it keeps `<base href="$FLUTTER_BASE_HREF">`). We never change it for deploy.
- **`flutter build web --base-href /repo-name/`** replaces `$FLUTTER_BASE_HREF` only in **`build/web/index.html`** (e.g. `<base href="/saas/">`).
- We deploy **only the contents of `build/web`** to the `gh-pages` branch (not the project root, not `web/`, not `lib/`). That is what GitHub Pages serves when the source is **gh-pages**.
