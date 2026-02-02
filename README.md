# saas

A Flutter application (mobile + web).

## Getting Started

This project is a starting point for a Flutter application.

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/)

## Deploying the web app to GitHub Pages

The **built** Flutter web app (in `build/web/`) must be deployed for the site to load the app instead of this README.

1. **Enable GitHub Pages from Actions**  
   In your repo: **Settings → Pages → Build and deployment → Source** → choose **GitHub Actions**.

2. **Deploy**  
   Push to `main` (or run the workflow manually from the **Actions** tab). The workflow builds the web app and deploys it to GitHub Pages.

3. **Open the app**  
   After the first successful deploy, the app is at:  
   **`https://<your-username>.github.io/<repo-name>/`**  
   (e.g. `https://vishal.github.io/saas/`). The root URL of the repo may still show README until you open the above link.

If you use a **user/org site** (repo named `username.github.io`) and want the app at the root URL, change the workflow’s build step to run `flutter build web --release` (no `--base-href`).
