import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  static const _sidebarWidth = 220.0;
  static const _purple = Color(0xFF4F46E5);
  static const _purpleLight = Color(0xFFE0E7FF);
  static const _textDark = Color(0xFF1F2937);
  static const _textMuted = Color(0xFF6B7280);
  static const _sidebarBg = Color(0xFFF9FAFB);
  static const _cardBg = Color(0xFFF9FAFB);
  static const _tableHeaderBg = Color(0xFF374151);
  static const _border = Color(0xFFE5E7EB);
  static const _expiredBadge = Color(0xFFDC2626);
  static const _expiringBadge = Color(0xFFFCD34D);
  static const _expiringText = Color(0xFF92400E);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSidebar(context),
                Expanded(child: _buildMainContent(context)),
              ],
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: Text(
        '© 2026 All rights reserved',
        style: Get.textTheme.bodySmall?.copyWith(color: _textMuted, fontSize: 12),
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    final navItems = [
      _NavItem(icon: Icons.grid_view, label: 'Dashboard', isActive: true),
      _NavItem(icon: Icons.people_outline, label: 'Members'),
      _NavItem(icon: Icons.calendar_today_outlined, label: 'Subscriptions'),
      _NavItem(icon: Icons.refresh_outlined, label: 'Renewals'),
      _NavItem(icon: Icons.notifications_outlined, label: 'Reminders'),
      _NavItem(icon: Icons.bar_chart_outlined, label: 'Reports'),
      _NavItem(icon: Icons.settings_outlined, label: 'Settings'),
    ];
    return Container(
      width: _sidebarWidth,
      color: _sidebarBg,
      child: Column(
        children: [
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.orange.shade300,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(Icons.grid_view, size: 18, color: Colors.orange.shade800),
              ),
              const SizedBox(width: 8),
              Text(
                'SaaS',
                style: Get.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ...navItems.map((e) => _buildNavTile(e)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: InkWell(
              onTap: controller.onLogout,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: _textMuted, size: 22),
                    const SizedBox(width: 12),
                    Text(
                      'Logout',
                      style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildNavTile(_NavItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: item.isActive ? _purpleLight : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => controller.onNavTap(0),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 22,
                  color: item.isActive ? _purple : _textMuted,
                ),
                const SizedBox(width: 12),
                Text(
                  item.label,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: item.isActive ? _textDark : _textMuted,
                    fontWeight: item.isActive ? FontWeight.w600 : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopBar(),
          const SizedBox(height: 24),
          Text(
            'Dashboard',
            style: Get.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: _textDark,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Manage everything here',
            style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted, fontSize: 14),
          ),
          const SizedBox(height: 24),
          _buildSummaryCards(),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: _buildRenewalsSection()),
              const SizedBox(width: 24),
              SizedBox(
                width: 340,
                child: Column(
                  children: [
                    _buildAiInsightsCard(),
                    const SizedBox(height: 20),
                    _buildUpcomingRemindersCard(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined, color: _textMuted, size: 24),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFFDBEAFE),
          child: Icon(Icons.person, color: _purple, size: 22),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: controller.onAddMember,
          style: ElevatedButton.styleFrom(
            backgroundColor: _purple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 0,
          ),
          child: const Text('Add Member'),
        ),
      ],
    );
  }

  Widget _buildSummaryCards() {
    final cards = [
      _SummaryCard(icon: Icons.people, iconColor: _purple, value: '284', label: 'Active Members'),
      _SummaryCard(icon: Icons.schedule, iconColor: Colors.orange, value: '18', label: 'Expiring (7 Days)'),
      _SummaryCard(icon: Icons.shield_outlined, iconColor: Colors.red, value: '7', label: 'Expired'),
      _SummaryCard(icon: Icons.check_box_outlined, iconColor: Colors.green, value: '96', label: 'Renewed (This Month)'),
    ];
    return Row(
      children: [
        for (int i = 0; i < cards.length; i++)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: i < cards.length - 1 ? 16 : 0),
              child: _summaryCard(cards[i]),
            ),
          ),
      ],
    );
  }

  Widget _summaryCard(_SummaryCard c) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: _border, width: 0.5),
      ),
      child: Row(
        children: [
          Icon(c.icon, color: c.iconColor, size: 40),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.value,
                  style: Get.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _textDark,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  c.label,
                  style: Get.textTheme.bodySmall?.copyWith(color: _textMuted, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRenewalsSection() {
    final rows = [
      _RenewalRow(name: 'Rahul Kamath', plan: 'Quarterly', expiry: '01/01/2026', status: 'Expired', isExpired: true),
      _RenewalRow(name: 'Lina Benny Thomas', plan: 'Monthly', expiry: '15/01/2026', status: 'Expiring', isExpired: false),
      _RenewalRow(name: 'Ankith Rawat', plan: 'Yearly', expiry: '15/01/2026', status: 'Expiring', isExpired: false),
      _RenewalRow(name: 'Alex George', plan: 'Monthly', expiry: '15/01/2026', status: 'Expiring', isExpired: false),
      _RenewalRow(name: 'Mary Steenberg', plan: 'Yearly', expiry: '15/01/2026', status: 'Expiring', isExpired: false),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: _border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Action Required - Renewals',
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _textDark,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: controller.onViewAllRenewals,
                  child: Text(
                    'View All Renewals',
                    style: Get.textTheme.bodyMedium?.copyWith(
                      color: _purple,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: _purple,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1.2),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1.2),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(color: _tableHeaderBg),
                children: [
                  _tableCell('Name', isHeader: true),
                  _tableCell('Plan', isHeader: true),
                  _tableCell('Expiry', isHeader: true),
                  _tableCell('Status', isHeader: true),
                  _tableCell('Action', isHeader: true),
                ],
              ),
              ...rows.map(
                (r) => TableRow(
                  decoration: const BoxDecoration(color: Colors.white),
                  children: [
                    _tableCell(r.name),
                    _tableCell(r.plan),
                    _tableCell(r.expiry),
                    _tableCell(r.status, isBadge: true, isExpired: r.isExpired),
                    _tableCell('', isActions: true),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tableCell(String text, {bool isHeader = false, bool isBadge = false, bool isExpired = false, bool isActions = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: isActions
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _actionIcon(Icons.notifications_none),
                const SizedBox(width: 8),
                _actionIcon(Icons.refresh),
                const SizedBox(width: 8),
                _actionIcon(Icons.visibility_outlined),
              ],
            )
          : isBadge
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isExpired ? _expiredBadge : _expiringBadge,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    text,
                    style: Get.textTheme.labelSmall?.copyWith(
                      color: isExpired ? Colors.white : _expiringText,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: isHeader ? Colors.white : _textDark,
                    fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
    );
  }

  Widget _actionIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: _sidebarBg,
        shape: BoxShape.circle,
        border: Border.all(color: _border),
      ),
      child: Icon(icon, size: 18, color: _textMuted),
    );
  }

  Widget _buildAiInsightsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: _border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Insights',
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: _textDark,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'You may lose ₹18,000 this week due to 6 memberships expiring. Sending reminders today could recover ₹12,500.',
            style: Get.textTheme.bodyMedium?.copyWith(color: _textDark, height: 1.5, fontSize: 14),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.onSendRemindersNow,
              style: ElevatedButton.styleFrom(
                backgroundColor: _purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
              ),
              child: const Text('Send Reminders Now'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingRemindersCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: _border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Reminders',
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: _textDark,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('John Doe', style: Get.textTheme.bodyMedium?.copyWith(color: _textDark)),
              Text('WhatsApp . 18:20:36', style: Get.textTheme.bodySmall?.copyWith(color: _textMuted)),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final bool isActive;
  _NavItem({required this.icon, required this.label, this.isActive = false});
}

class _SummaryCard {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;
  _SummaryCard({required this.icon, required this.iconColor, required this.value, required this.label});
}

class _RenewalRow {
  final String name;
  final String plan;
  final String expiry;
  final String status;
  final bool isExpired;
  _RenewalRow({required this.name, required this.plan, required this.expiry, required this.status, required this.isExpired});
}
