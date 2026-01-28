import 'dart:io';

bool get isAndroid => _isAndroid ?? Platform.isAndroid;
bool? _isAndroid;

bool get isIOS => _isIOS ?? Platform.isIOS;
bool? _isIOS;

void setPlatformForTesting({bool? android, bool? ios}) {
  _isAndroid = android;
  _isIOS = ios;
}

void resetPlatform() {
  _isAndroid = null;
  _isIOS = null;
}
