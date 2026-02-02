import 'web_url_helper_stub.dart'
    if (dart.library.html) 'web_url_helper_web.dart' as impl;

/// On web: updates the browser URL to [path]. On other platforms: no-op.
void updateBrowserUrl(String path) => impl.updateBrowserUrl(path);
