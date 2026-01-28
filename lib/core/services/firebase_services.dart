import 'dart:developer';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:saas/core/services/push_notification_service.dart';
import 'package:saas/core/services/remote_config_services.dart';
import '../../shared/utils/firebase_options.dart';
import 'network_checker.dart';

class FirebaseServices with RemoteConfigService, PushNotificationService {
  /// Checks if the network is connected.
  /// Returns `true` if the network is connected, `false` otherwise.
  FirebaseAnalytics? analytics;
  late FirebaseAnalyticsObserver observer;
  bool isNetworkConnected() => Get.find<NetworkChecker>().isConnected.value;

  Future<void> initializeFirebase() async {
    log("Initializing Firebase");
    if (!isNetworkConnected()) {
      log("Internet is not available");
      return;
    }
    bool isSuccess = false;
    int retryCount = 0;
    while (!isSuccess && retryCount < 3) {
      try {
        await _initializeFirebaseCore();
        // final bool isRemoteConfigInitialized = await initRemoteConfig();
        // if (isRemoteConfigInitialized) {
        //   appLog.info("Remote Config initialized");
        // } else {
        //   appLog.info("Remote Config not initialized");
        // }
        // final bool isPushNotificationInitialized =
        //     await initPushNotifications();
        // if (isPushNotificationInitialized) {
        //   appLog.info("Push Notification initialized");
        // } else {
        //   appLog.info("Push Notification not initialized");
        // }
        isSuccess = true;
      } catch (e) {
        retryCount++;
        log("Retrying Firebase services initialization... ($retryCount)");
      }
    }

    if (!isSuccess) {
      // Show error or retry message to the user
      if (kDebugMode) {
        print("Failed to initialize Firebase services after retries.");
      }
    }

    // await _initializeMixPanel();
    // await _initializeAppsFlyer();
    // _configureErrorHandling();
  }

  /// Initializes Firebase core services.
  Future<void> _initializeFirebaseCore() async {
    // Check if Firebase is already initialized
    if (Firebase.apps.isEmpty) {
      final FirebaseOptions options = DefaultFirebaseOptions.currentPlatform;
      await Firebase.initializeApp(options: options);
    }
    analytics = FirebaseAnalytics.instance;
    observer = FirebaseAnalyticsObserver(analytics: analytics!);
  }
}
