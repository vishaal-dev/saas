import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
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
              opacity: 0.80,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter, // 0 deg
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xFF0F172A), const Color(0xFF334F90)],
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
                    color: Color(0xFFF8FAFC),
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
                        'Login',
                        textAlign: TextAlign.center,
                        style: Get.theme.textTheme.bodyLarge?.copyWith(
                          color: Color(0xFF4F46E5),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'User Name',
                        style: Get.theme.textTheme.labelMedium?.copyWith(
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(controller, hint: 'Enter username'),
                      const SizedBox(height: 20),
                      Text(
                        'Password',
                        style: Get.theme.textTheme.labelMedium?.copyWith(
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildPasswordField(controller),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: controller.onForgotPassword,
                          child: Text(
                            'Forgot Password?',
                            style: Get.theme.textTheme.labelMedium!.copyWith(
                              color: Color(0xFF94A3B8),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.isFormValid.value
                              ? controller.onLogin
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.isFormValid.value
                                ? const Color(0xFF4F46E5)
                                : const Color(0xFFA5B4FC),
                            disabledBackgroundColor: const Color(0xFFA5B4FC),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: Get.theme.textTheme.bodyMedium?.copyWith(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(
                                text: 'Any support required? ',
                                style: Get.theme.textTheme.bodySmall?.copyWith(
                                  color: Color(0xFF475569),
                                ),
                              ),
                              TextSpan(
                                text: 'Reach out to us',
                                style: Get.theme.textTheme.bodySmall?.copyWith(
                                  color: Color(0xFF475569),
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = controller.onReachOutTap,
                              ),
                            ],
                          ),
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

  Widget _buildTextField(LoginController c, {required String hint}) {
    return MouseRegion(
      onEnter: (_) => c.setUsernameHovered(true),
      onExit: (_) => c.setUsernameHovered(false),
      child: Obx(
        () => TextField(
          controller: c.usernameController,
          style: Get.theme.textTheme.bodySmall?.copyWith(
            color: Color(0xFF0F172A),
          ),
          cursorColor: Color(0xFF0F172A),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Get.theme.textTheme.labelMedium!.copyWith(
              color: const Color(0xFF94A3B8),
            ),
            filled: true,
            fillColor: Color(0xFFFFFFFF),
            hoverColor: Color(0xFFFFFFFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: c.isUsernameHovered.value
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

  Widget _buildPasswordField(LoginController c) {
    return MouseRegion(
      onEnter: (_) => c.setPasswordHovered(true),
      onExit: (_) => c.setPasswordHovered(false),
      child: Obx(
        () => TextField(
          controller: c.passwordController,
          obscureText: !c.isPasswordVisible.value,
          style: Get.theme.textTheme.bodySmall?.copyWith(
            color: Color(0xFF0F172A),
          ),
          cursorColor: Color(0xFF0F172A),
          decoration: InputDecoration(
            hintText: 'Enter Password',
            hintStyle: Get.theme.textTheme.labelMedium!.copyWith(
              color: Color(0xFF94A3B8),
            ),
            filled: true,
            fillColor: Color(0xFFFFFFFF),
            hoverColor: Color(0xFFFFFFFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: c.isPasswordHovered.value
                    ? const Color(0xFF6C63FF)
                    : Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF6C63FF)),
            ),
            suffixIcon: IconButton(
              onPressed: c.togglePasswordVisibility,
              icon: Image.asset(
                c.isPasswordVisible.value
                    ? 'assets/icons/eye-open.png'
                    : 'assets/icons/eye-close.png',
                width: 22,
                height: 22,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
