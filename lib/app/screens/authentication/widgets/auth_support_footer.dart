import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_constants.dart';

/// Reusable support footer link for authentication screens.
class AuthSupportFooter extends StatelessWidget {
  const AuthSupportFooter({super.key, required this.onReachOut});

  final VoidCallback onReachOut;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Any support required? ',
              style: Get.theme.textTheme.bodySmall?.copyWith(
                color: AuthConstants.supportTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Reach out to us',
              style: Get.theme.textTheme.bodySmall?.copyWith(
                color: AuthConstants.supportTextColor,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
              ),
              recognizer: TapGestureRecognizer()..onTap = onReachOut,
            ),
          ],
        ),
      ),
    );
  }
}
