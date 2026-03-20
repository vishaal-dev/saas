import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/screens/authentication/widgets/app_constants.dart';

/// Plan options for the dropdown.
const List<String> kPlanOptions = ['Monthly', 'Quarterly', 'Yearly'];

/// A plan selector dropdown that matches the reference UI: white rounded menu
/// with soft shadow, no border, generous padding and light gray separators.
class PlanDropdown extends StatelessWidget {
  const PlanDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.hint = 'Choose a Plan',
  });

  final String? value;
  final ValueChanged<String?> onChanged;
  final String hint;

  static const double _menuBorderRadius = 12;
  static const double _menuElevation = 8;
  static const EdgeInsets _itemPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  );

  Future<void> _showPlanMenu(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;

    final overlayState = Overlay.of(context);
    final overlayRender = overlayState.context.findRenderObject() as RenderBox?;
    if (overlayRender == null) return;

    final topLeft = box.localToGlobal(Offset.zero, ancestor: overlayRender);
    final size = box.size;
    final oSize = overlayRender.size;
    const gap = 4.0;

    final overlayRect = Offset.zero & oSize;
    final anchorLeft = topLeft.dx.clamp(0.0, oSize.width);
    final anchorTop = (topLeft.dy + size.height + gap).clamp(0.0, oSize.height);
    final anchorWidth = size.width.clamp(
      1.0,
      (oSize.width - anchorLeft).clamp(1.0, oSize.width),
    );
    final anchorBelow = Rect.fromLTWH(anchorLeft, anchorTop, anchorWidth, 1);
    final position = RelativeRect.fromRect(anchorBelow, overlayRect);

    final selected = await showMenu<String>(
      context: context,
      position: position,
      constraints: BoxConstraints(minWidth: size.width, maxWidth: size.width),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_menuBorderRadius),
      ),
      color: Colors.white,
      elevation: _menuElevation,
      items: [
        _buildMenuItem('Monthly'),
        const PopupMenuDivider(height: 1),
        _buildMenuItem('Quarterly'),
        const PopupMenuDivider(height: 1),
        _buildMenuItem('Yearly'),
      ],
    );
    if (selected != null) onChanged(selected);
  }

  PopupMenuItem<String> _buildMenuItem(String plan) {
    return PopupMenuItem<String>(
      value: plan,
      padding: _itemPadding,
      child: Text(
        plan,
        style: Get.theme.textTheme.bodyMedium?.copyWith(
          color: AppConstants.labelColor,
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showPlanMenu(context),
      borderRadius: BorderRadius.circular(AppConstants.fieldBorderRadius),
      child: Container(
        height: AppConstants.fieldHeight,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppConstants.fieldFillColor,
          borderRadius: BorderRadius.circular(AppConstants.fieldBorderRadius),
          border: Border.all(color: AppConstants.borderColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value ?? hint,
                style: Get.theme.textTheme.labelMedium?.copyWith(
                  color: value != null
                      ? AppConstants.labelColor
                      : AppConstants.hintColor,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: AppConstants.hintColor,
            ),
          ],
        ),
      ),
    );
  }
}
