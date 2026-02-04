import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_constants.dart';

/// Reusable label for form fields in authentication screens.
class AuthFormFieldLabel extends StatelessWidget {
  const AuthFormFieldLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Get.theme.textTheme.labelMedium?.copyWith(
        color: AuthConstants.labelColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
