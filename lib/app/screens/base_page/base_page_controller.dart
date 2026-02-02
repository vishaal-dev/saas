import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/app_settings_controller.dart';
import '../../../core/di/get_injector.dart';
import '../../../navigation/navigation_mixins.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/utils/base_controller.dart';
import '../authentication/login/login.dart';

class BasePageController extends BaseController {
  GlobalKey<ScaffoldState>? _scaffoldKey;
  RxString appBarTitle = Get.find<AppSettingsController>().isUserLoggedIn.value
      ? PageTitles.home.obs
      : ''.obs; // Reactive appBarTitle for Obx
  Widget currentPage = Get.find<AppSettingsController>().isUserLoggedIn.value
      ? Login()
      //  : OnboardingScreen();
      : Login();

  @override
  Future<void> onInit() async {
    await fetchArgs();
    super.onInit();
  }

  Future<void> fetchArgs() async {
    try {
      await setDefaultLanding();
    } catch (e) {
      log("Error fetching arguments: $e");
    }
  }

  ///Set the default landing page from the firebase data store
  Future<void> setDefaultLanding() async {
    //Logs.stringLogger("setDefaultLanding");
    try {
      print(
        "setDefaultLanding called${appSettingsController.isUserLoggedIn.value}",
      );
      if (appSettingsController.isUserLoggedIn.value) {
        //Logs.stringLogger("UserLoggedIn:: true");
        //if (userData != null) {
        //Logs.stringLogger("UserDataExist:: true");
        // log("data exist");

        final String path = AppRoutes.home;
        final title = appNav.getTitleOfPath(path);
        final newPage = appNav.getViewForPath(path);

        appNav.currentPage.value = '';
        appNav.pageStack.clear();

        appNav.currentPage.value = path;
        appNav.pageStack.add(path);

        log("path:: $path");
        updatePage(title, newPage, null);
        //  }
      } else {
        // Logs.stringLogger("UserLoggedIn:: false");
        if (appBarTitle.value.isEmpty) {
          //  Logs.stringLogger("App bar title is empty");

          final String path = AppRoutes.home;
          final title = appNav.getTitleOfPath(path);
          final newPage = appNav.getViewForPath(path);

          appNav.currentPage.value = '';
          appNav.pageStack.clear();

          appNav.currentPage.value = path;
          appNav.pageStack.add(path);

          log("path:: $path");
          updatePage(title, newPage, null);

          // appBarTitle.value = PageTitles.login;
          // currentPage = LoginScreen();
          // updatePage(appBarTitle.value, currentPage, null);
        } else {
          // Logs.stringLogger("App bar title and widget are not empty");
          if (appSettingsController.isUserLogout.value) {
            print("logout happening, but values not updated");
            // appNav.changePage('/quotes');
            appBarTitle.value = PageTitles.home;
            currentPage = Login();
            updatePage(appBarTitle.value, currentPage, null);
          }
        }
      }
    } catch (e) {
      //await getDataFromFb(currentSeconds: 5);
    }
  }

  /// Setter to initialize the ScaffoldKey in the controller
  void setScaffoldKey(GlobalKey<ScaffoldState> key) {
    _scaffoldKey = key;
  }

  /// This method will be called when the navigation page changes
  void updatePage(String newPageTitle, Widget newPage, dynamic arguments) {
    //Logs.stringLogger("newPage---- ${newPage}");
    //Logs.stringLogger("newPageTitle---- ${newPageTitle}");
    log("updatePage:: $newPageTitle");
    appBarTitle.value = newPageTitle;
    currentPage = newPage;
    //final Path = appNav.getPathOfTitle(newPageTitle);
    //updateMenuSubscriptionFromPath(path: Path);
    update(); // Calls GetBuilder to rebuild the UI
  }

  // void changeTheme({required ThemeSwitcherState switcher}) {
  //   themeServices.toggleThemMode(); // Toggle theme mode
  //   switcher.changeTheme(
  //     theme: themeServices.isDarkTheme.value
  //         ? AppTheme.darkTheme.copyWith(
  //             colorScheme: ColorScheme.fromSeed(
  //               seedColor: AppColors.appPrimaryColorLight,
  //               surface: Colors.black,
  //             ),
  //           )
  //         : AppTheme.lightTheme.copyWith(
  //             colorScheme: ColorScheme.fromSeed(
  //               seedColor: AppColors.appPrimaryColorLight,
  //               surface: Colors.white,
  //             ),
  //           ),
  //   );
  // }

  // String setAppVersion() {
  //   String appVersion = "";
  //   appFunctions
  //       .deviceDetailsSetup(DeviceDetailResultType.appVersion)
  //       .then((value) => appVersion = value);
  //   return appVersion;
  // }
}
