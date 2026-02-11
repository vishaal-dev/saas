import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Settings page content: header and list of setting options.
/// Used inside the dashboard main content area when Settings nav is selected.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  static const _textDark = Color(0xFF333333);
  static const _textMuted = Color(0xFF666666);
  static const _border = Color(0xFFE5E7EB);

  static const _settingItems = [
    'Logo',
    'Data Backup option',
    'Colour theme',
    'Log out of all devices option',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildSettingsList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Settings',
          style: Get.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: _textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Manage your business, preferences, and account',
          style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
        ),
      ],
    );
  }

  Widget _buildSettingsList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < _settingItems.length; i++) ...[
            if (i > 0)
              Divider(
                height: 1,
                thickness: 1,
                color: _border,
              ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(right: 14),
                        decoration: BoxDecoration(
                          color: _textMuted,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          _settingItems[i],
                          style: Get.textTheme.bodyMedium?.copyWith(
                            color: _textDark,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: _textMuted,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
