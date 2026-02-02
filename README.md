# saas

A Flutter application (mobile + web).

## Getting Started

This project is a starting point for a Flutter application.

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/)

## Deploying the web app to GitHub Pages (show Login app, not README)

The site will show your Flutter app (e.g. login screen) only if GitHub Pages serves the **built** app from the `gh-pages` branch.

**How it works:** `web/index.html` is a template (keeps `<base href="$FLUTTER_BASE_HREF">`). At build time Flutter replaces that only in **`build/web/index.html`** (e.g. `<base href="/saas/">`). We deploy **only the contents of `build/web`** (the generated files), not the project root, not `web/`, not `lib/`. That’s what GitHub Pages serves.

Do this once:

### Step 1: Run the deploy workflow

- Push this repo to `main`, **or**
- In the repo open **Actions** → **Deploy to GitHub Pages** → **Run workflow**.

Wait until the workflow run finishes (green check).

### Step 2: Tell GitHub Pages to use the built app

1. In the repo go to **Settings** → **Pages**.
2. Under **Build and deployment** → **Source**, choose **Deploy from a branch**.
3. Under **Branch**, select **gh-pages** and **/ (root)**.
4. Click **Save**.

### Step 3: Open your app

Your app (same as when you run it locally) will be at:

**`https://<your-github-username>.github.io/<repo-name>/`**

Example: if the repo is `vishal/saas`, open **https://vishal.github.io/saas/** (with the trailing slash).

Until Step 2 is done, or if you open the repo root URL without the path above, you may still see README; use the exact URL above to see the login screen.
