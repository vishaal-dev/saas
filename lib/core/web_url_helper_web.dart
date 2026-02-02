import 'dart:html' as html;

/// Updates the browser address bar to [path] so the URL reflects the current route.
void updateBrowserUrl(String path) {
  html.window.history.pushState(null, '', path);
}
