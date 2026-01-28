import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:saas/shared/utils/platform_proxy.dart';
import '../../core/controllers/app_settings_controller.dart';
import '../../core/di/get_injector.dart';
import '../constants/app.dart';
import '../constants/box_constants.dart';

class AppFunctions {
  /// Sets up device details based on the provided DeviceDetailResultType.
  ///
  /// [deviceDetailResultType] The type of device detail result required.
  /// Returns a string representing the requested device detail.
  Future<String> deviceDetailsSetup(
    DeviceDetailResultType deviceDetailResultType,
  ) async {
    switch (deviceDetailResultType) {
      case DeviceDetailResultType.checkBuildNumber:
        return _getBuildNumber();
      case DeviceDetailResultType.appVersion:
        return _getAppVersion();
      case DeviceDetailResultType.getDeviceId:
        return _getDeviceId();
      case DeviceDetailResultType.setDeviceDetail:
        return _setDeviceDetail();
    }
  }

  /// Retrieves the build number of the app.
  Future<String> _getBuildNumber() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  /// Retrieves the version of the app.
  Future<String> _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// Retrieves the device ID based on the platform.
  Future<String> _getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (isAndroid) {
      final AndroidDeviceInfo androidDeviceInfo =
          await deviceInfoPlugin.androidInfo;
      return "ANDROID${androidDeviceInfo.id}";
    } else if (isIOS) {
      final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      return "iOS${iosDeviceInfo.identifierForVendor.toString()}";
    }
    return "UNKNOWN";
  }

  /// Sets the device detail if it has changed.
  Future<String> _setDeviceDetail() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String buildNumber = boxDb.readStringValue(
      key: BoxConstants.buildNumber,
    );
    final String versionNumber = boxDb.readStringValue(
      key: BoxConstants.currentVersion,
    );

    if (packageInfo.buildNumber != buildNumber ||
        packageInfo.version != versionNumber) {
      Get.find<AppSettingsController>().isAppUpdated.value = true;
      return _updateDeviceDetail(packageInfo);
    }
    return "";
  }

  /// Updates the device detail and stores it in the database.
  Future<String> _updateDeviceDetail(PackageInfo packageInfo) async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidDeviceInfo =
          await deviceInfoPlugin.androidInfo;
      _storeDeviceDetail(
        deviceID: "ANDROID${androidDeviceInfo.id}",
        buildNumber: packageInfo.buildNumber,
        version: packageInfo.version,
      );
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      _storeDeviceDetail(
        deviceID: "iOS${iosDeviceInfo.identifierForVendor.toString()}",
        buildNumber: packageInfo.buildNumber,
        version: packageInfo.version,
      );
    }
    return "";
  }

  /// Stores the device details in the database.
  void _storeDeviceDetail({
    required String deviceID,
    required String buildNumber,
    required String version,
  }) {
    boxDb.writeStringValue(key: BoxConstants.deviceID, value: deviceID);
    boxDb.writeStringValue(key: BoxConstants.buildNumber, value: buildNumber);
    boxDb.writeStringValue(key: BoxConstants.currentVersion, value: version);
  }

  /// Retrieves specific device information based on the provided DeviceInfoName.
  ///
  /// [infoName] The type of device information required.
  /// Returns the requested device information.
  Future<dynamic> getDeviceInfo({required DeviceInfoName infoName}) async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return _getAndroidDeviceInfo(infoName, deviceInfoPlugin);
    } else if (Platform.isIOS) {
      return _getIOSDeviceInfo(infoName, deviceInfoPlugin);
    }
    return null;
  }

  /// Retrieves specific Android device information.
  Future<dynamic> _getAndroidDeviceInfo(
    DeviceInfoName infoName,
    DeviceInfoPlugin deviceInfoPlugin,
  ) async {
    final AndroidDeviceInfo androidDeviceInfo =
        await deviceInfoPlugin.androidInfo;
    switch (infoName) {
      case DeviceInfoName.sdkInt:
        return androidDeviceInfo.version.sdkInt;
      default:
        return null;
    }
  }

  /// Retrieves specific iOS device information.
  Future<dynamic> _getIOSDeviceInfo(
    DeviceInfoName infoName,
    DeviceInfoPlugin deviceInfoPlugin,
  ) async {
    final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    switch (infoName) {
      case DeviceInfoName.sdkInt:
        return iosDeviceInfo.systemVersion;
      default:
        return null;
    }
  }
}
