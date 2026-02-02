import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'forgot_password_controller.dart';

class ForgotPassword extends GetView<ForgotPasswordController> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/login-background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.75,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF0F172A),
                      const Color(0xFF334F90),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x40000000),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/saas-logo.png',
                            height: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Forgot Password?',
                        textAlign: TextAlign.center,
                        style: Get.theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF4F46E5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Email Address/Phone Number',
                        style: Get.theme.textTheme.labelMedium?.copyWith(
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(controller),
                      const SizedBox(height: 16),
                      Text(
                        'OTP will be sent to the\nEmail Address/Phone Number',
                        textAlign: TextAlign.center,
                        style: Get.theme.textTheme.bodySmall?.copyWith(
                          color: Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.isFormValid.value
                              ? controller.onGetOtp
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.isFormValid.value
                                ? const Color(0xFF4F46E5)
                                : const Color(0xFFA5B4FC),
                            disabledBackgroundColor: const Color(0xFFA5B4FC),
                            foregroundColor: Colors.white,
                            disabledForegroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Get OTP'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(ForgotPasswordController c) {
    return MouseRegion(
      onEnter: (_) => c.setEmailHovered(true),
      onExit: (_) => c.setEmailHovered(false),
      child: Obx(
        () => TextField(
          controller: c.emailOrPhoneController,
          style: const TextStyle(color: Colors.black),
          cursorColor: Color(0xFF0F172A),
          decoration: InputDecoration(
            hintText: 'Enter Email Address /Phone Number',
            hintStyle: Get.theme.textTheme.labelMedium!.copyWith(
              color: const Color(0xFF94A3B8),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: c.isEmailHovered.value
                    ? const Color(0xFF6C63FF)
                    : Color(0xFFE2E8F0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF6C63FF)),
            ),
          ),
        ),
      ),
    );
  }
}
