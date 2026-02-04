import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saas/app/screens/authentication/widgets/auth_widgets.dart';

import 'otp_authentication_controller.dart';

class OtpAuthentication extends GetView<OtpAuthenticationController> {
  const OtpAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpAuthenticationController());
    return Scaffold(
      body: AuthScreenLayout(
        child: AuthFormCard(
          title: 'Forgot Password?',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthFormFieldSection(
                label: 'Enter OTP',
                spacingAfterLabel: 12,
                child: AuthOtpInput(
                  length: OtpAuthenticationController.otpLength,
                  controllers: controller.otpControllers,
                  focusNodes: controller.otpFocusNodes,
                  onChanged: controller.onOtpChanged,
                ),
              ),
              const SizedBox(height: AuthConstants.spacingAfterLabel),
              Center(
                child: TextButton(
                  onPressed: controller.onResendOtp,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Resend OTP',
                    style: Get.theme.textTheme.bodySmall?.copyWith(
                      color: AuthConstants.titleColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => AuthPrimaryButton(
                  text: 'Verify',
                  onPressed: controller.onVerify,
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
