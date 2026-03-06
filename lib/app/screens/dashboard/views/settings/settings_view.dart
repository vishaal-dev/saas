import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_mobile_view.dart';
import 'settings_tablet_view.dart';

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
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    return SingleChildScrollView(
      padding: isMobile ? const EdgeInsets.all(16) : (isTablet ? const EdgeInsets.all(24) : EdgeInsets.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(isMobile),
          const SizedBox(height: 24),
          if (isMobile)
            const SettingsMobileView(settingItems: _settingItems)
          else if (isTablet)
            const SettingsTabletView(settingItems: _settingItems)
          else
            _buildSettingsList(),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Settings',
          style: (isMobile
                  ? Get.textTheme.headlineSmall
                  : Get.textTheme.headlineMedium)
              ?.copyWith(
            fontWeight: FontWeight.bold,
            color: _textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Manage your business, preferences, and account',
          style: Get.textTheme.bodyMedium?.copyWith(
            color: _textMuted,
            fontSize: isMobile ? 13 : 14,
          ),
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
              const Divider(
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
                        decoration: const BoxDecoration(
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
                      const Icon(
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
