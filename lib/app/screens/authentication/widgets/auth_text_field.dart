import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_constants.dart';

/// Reusable styled text field for authentication screens.
class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.isHovered = false,
    this.dismissKeyboardOnTapOutside = true,
  });

  final TextEditingController controller;
  final String hint;
  final bool isHovered;
  final bool dismissKeyboardOnTapOutside;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.fieldHeight,
      child: TextField(
        controller: controller,
        onTapOutside: dismissKeyboardOnTapOutside
            ? (_) => FocusManager.instance.primaryFocus?.unfocus()
            : (_) {},
        style: Get.theme.textTheme.bodySmall?.copyWith(
          color: AppConstants.textColor,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Get.theme.textTheme.labelMedium!.copyWith(
            color: AppConstants.hintColor,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: AppConstants.fieldFillColor,
          hoverColor: AppConstants.fieldFillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.fieldBorderRadius),
            borderSide: const BorderSide(color: AppConstants.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.fieldBorderRadius),
            borderSide: BorderSide(
              color: isHovered
                  ? AppConstants.focusedBorderColor
                  : AppConstants.borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.fieldBorderRadius),
            borderSide: const BorderSide(
              color: AppConstants.focusedBorderColor,
            ),
          ),
        ),
      ),
    );
  }
}
