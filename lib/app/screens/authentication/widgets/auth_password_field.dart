import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_constants.dart';

/// Reusable password field with visibility toggle for authentication screens.
class AuthPasswordField extends StatelessWidget {
  const AuthPasswordField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onToggleVisibility,
    this.hint = 'Enter Password',
    this.isHovered = false,
  });

  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleVisibility;
  final String hint;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AuthConstants.fieldHeight,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: Get.theme.textTheme.bodySmall?.copyWith(
          color: AuthConstants.textColor,
        ),
        cursorColor: AuthConstants.textColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Get.theme.textTheme.labelMedium!.copyWith(
            color: AuthConstants.hintColor,
          ),
          filled: true,
          fillColor: AuthConstants.fieldFillColor,
          hoverColor: AuthConstants.fieldFillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AuthConstants.fieldBorderRadius,
            ),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AuthConstants.fieldBorderRadius,
            ),
            borderSide: BorderSide(
              color: isHovered
                  ? AuthConstants.focusedBorderColor
                  : Colors.grey.shade300,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AuthConstants.fieldBorderRadius,
            ),
            borderSide: const BorderSide(
              color: AuthConstants.focusedBorderColor,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Image.asset(
              obscureText
                  ? 'assets/icons/eye-close.png'
                  : 'assets/icons/eye-open.png',
              width: 22,
              height: 22,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
