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
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(double.infinity, AuthConstants.buttonHeight),
        backgroundColor: isEnabled
            ? AuthConstants.buttonEnabledColor
            : AuthConstants.buttonDisabledColor,
        disabledBackgroundColor: AuthConstants.buttonDisabledColor,
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AuthConstants.fieldBorderRadius,
          ),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Get.theme.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.15,
        ),
      ),
    );
  }
}
