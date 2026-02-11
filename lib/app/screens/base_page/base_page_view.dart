import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/di/get_injector.dart';
import '../../../shared/widgets/base/bottom_navigation_bar.dart';
import '../../../shared/widgets/base/custom_app_bar.dart';
import 'base_page_controller.dart';

class BasePageView extends StatelessWidget {
  BasePageView({super.key});

  final BasePageController controller = Get.put(BasePageController());

  // Create a unique GlobalKey for each instance of BasePageView
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    controller.setScaffoldKey(scaffoldKey);
    appNav.setNavigationCallback((
      String newTitle,
      Widget newPage,
      dynamic arguments,
    ) {
      controller.updatePage(newTitle, newPage, arguments);
    });

    return PopScope(
      onPopInvokedWithResult: (didPop, res) async {
        appNav.popPage();
      },
      canPop: appNav.canPop(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        backgroundColor: Get.theme.primaryColor,
        appBar:
            controller.appSettingsController.isUserLoggedIn.value &&
                controller.appBarTitle.value != 'Home'
            ? CustomAppBar(
                appBarTitle: controller.appBarTitle.value,
                // Observing title
                appBarColor: Get.theme.primaryColor,
                // Observing background color
                /// do these after the bas is complete
                //isConnected: controller.networkChecker.isConnected,
                isConnected: true.obs,
                // Observing network status
                onNotificationPressed: () {
                  // Navigate to notifications
                },

                /// do these after the bas is complete
                isUserLoggedIn: controller.appSettingsController.isUserLoggedIn,
                //isUserLoggedIn: true.obs,
                // Observing user login status
                /// do these after the bas is complete
                // unreadNotificationCount: Get.find<AppDataController>()
                //     .userUnreadNewsCount, // Observing notification count
                unreadNotificationCount: 1.obs,
              )
            : null,
        //drawer: AppDrawer(),
        body: GetBuilder<BasePageController>(
          builder: (controller) => controller.currentPage,
        ),
        bottomNavigationBar:
            (controller.appSettingsController.isUserLoggedIn.value &&
                (controller.appBarTitle.value == 'Home' ||
                    controller.appBarTitle.value == 'All Categories' ||
                    controller.appBarTitle.value == 'Rewards' ||
                    controller.appBarTitle.value == 'Profile'))
            ? CustomBottomNavigationBar()
            : SizedBox(),
      ),
    );
  }
}
