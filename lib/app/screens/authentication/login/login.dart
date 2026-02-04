import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saas/app/screens/authentication/widgets/auth_widgets.dart';

import 'login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: AuthScreenLayout(
        child: AuthFormCard(
          title: 'Login',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthFormFieldSection(
                label: 'User Name',
                child: MouseRegion(
                  onEnter: (_) => controller.setUsernameHovered(true),
                  onExit: (_) => controller.setUsernameHovered(false),
                  child: Obx(
                    () => AuthTextField(
                      controller: controller.usernameController,
                      hint: 'Enter username',
                      isHovered: controller.isUsernameHovered.value,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AuthConstants.spacingBetweenFields),
              AuthFormFieldSection(
                label: 'Password',
                child: MouseRegion(
                  onEnter: (_) => controller.setPasswordHovered(true),
                  onExit: (_) => controller.setPasswordHovered(false),
                  child: Obx(
                    () => AuthPasswordField(
                      controller: controller.passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      onToggleVisibility: controller.togglePasswordVisibility,
                      isHovered: controller.isPasswordHovered.value,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AuthConstants.spacingAfterLabel),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.onForgotPassword,
                  child: Text(
                    'Forgot Password?',
                    style: Get.theme.textTheme.labelMedium!.copyWith(
                      color: AuthConstants.hintColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AuthConstants.spacingAfterLogo),
              Obx(
                () => AuthPrimaryButton(
                  text: 'Login',
                  onPressed: controller.onLogin,
                  isEnabled: controller.isFormValid.value,
                ),
              ),
              const SizedBox(height: AuthConstants.spacingAfterButton),
              AuthSupportFooter(onReachOut: controller.onReachOutTap),
            ],
          ),
        ),
      ),
    );
  }
}
