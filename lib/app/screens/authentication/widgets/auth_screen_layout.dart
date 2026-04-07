import 'package:flutter/material.dart';

import 'app_constants.dart';

/// Reusable authentication screen layout with solid background.
class AuthScreenLayout extends StatelessWidget {
  const AuthScreenLayout({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppConstants.gradientStart,
      child: Center(
        child: SingleChildScrollView(padding: padding, child: child),
      ),
    );
  }
}
