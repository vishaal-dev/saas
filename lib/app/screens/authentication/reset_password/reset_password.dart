import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saas/app/screens/authentication/widgets/auth_widgets.dart';

import 'reset_password_controller.dart';

class ResetPassword extends GetView<ResetPasswordController> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      body: AuthScreenLayout(
        child: AuthFormCard(
          title: 'Reset Password',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthFormFieldSection(
                label: 'New Password',
                spacingAfterLabel: 8,
                child: Obx(
                  () => AuthPasswordField(
                    controller: controller.newPasswordController,
                    obscureText: !controller.isNewPasswordVisible.value,
                    onToggleVisibility: controller.toggleNewPasswordVisibility,
                    hint: 'Enter New Password',
                  ),
                ),
              ),
              const SizedBox(height: AuthConstants.spacingBetweenFields),
              AuthFormFieldSection(
                label: 'Confirm Password',
                spacingAfterLabel: 8,
                child: Obx(
                  () => AuthPasswordField(
                    controller: controller.confirmPasswordController,
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    onToggleVisibility:
                        controller.toggleConfirmPasswordVisibility,
                    hint: 'Enter New Password',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => AuthPrimaryButton(
                  text: 'Reset Password',
                  onPressed: controller.onResetPassword,
                  isEnabled: controller.isFormValid.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
