import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saas/app/screens/authentication/widgets/auth_widgets.dart';

import 'forgot_password_controller.dart';

class ForgotPassword extends GetView<ForgotPasswordController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());
    return Scaffold(
      body: AuthScreenLayout(
        child: AuthFormCard(
          title: 'Forgot Password?',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthFormFieldSection(
                label: 'Email Address/Phone Number',
                child: MouseRegion(
                  onEnter: (_) => controller.setEmailHovered(true),
                  onExit: (_) => controller.setEmailHovered(false),
                  child: Obx(
                    () => AuthTextField(
                      controller: controller.emailOrPhoneController,
                      hint: 'Enter Email Address /Phone Number',
                      isHovered: controller.isEmailHovered.value,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AuthConstants.spacingAfterLabel),
              Text(
                'OTP will be sent to the\nEmail Address/Phone Number',
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.bodySmall?.copyWith(
                  color: AuthConstants.supportTextColor,
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => AuthPrimaryButton(
                  text: 'Get OTP',
                  onPressed: controller.onGetOtp,
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
