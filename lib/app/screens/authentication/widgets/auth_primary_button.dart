import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_constants.dart';

/// Reusable primary action button for authentication screens.
class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isEnabled,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AuthConstants.buttonHeight,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? AuthConstants.buttonEnabledColor
              : AuthConstants.buttonDisabledColor,
          disabledBackgroundColor: AuthConstants.buttonDisabledColor,
          padding: const EdgeInsets.symmetric(vertical: 12.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AuthConstants.fieldBorderRadius,
            ),
          ),
        ),
        child: Text(text, style: Get.theme.textTheme.bodyMedium),
      ),
    );
  }
}
