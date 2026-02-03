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
  static const _sidebarBg = Color(0xFFF3F4F6);
  static const _cardBg = Colors.white;
  static const _border = Color(0xFFE5E7EB);
  static const _expiredBadge = Color(0xFFFEE2E2);
  static const _expiredText = Color(0xFFDC2626);
  static const _expiringBadge = Color(0xFFFEF3C7);
  static const _expiringText = Color(0xFFD97706);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(context),
          Expanded(child: _buildMainContent(context)),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    final navItems = [
      _NavItem(icon: Icons.dashboard_outlined, label: 'Dashboard', isActive: true),
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
              Image.asset(
                'assets/images/saas-logo.png',
                height: 32,
                errorBuilder: (_, __, ___) => Icon(Icons.grid_view, color: _purple, size: 28),
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
          ListTile(
            leading: Icon(Icons.logout, color: _textMuted, size: 22),
            title: Text(
              'Logout',
              style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
            ),
            onTap: controller.onLogout,
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
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Manage everything here',
            style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
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
          const SizedBox(height: 40),
          Center(
            child: Text(
              '© 2026 All rights reserved',
              style: Get.textTheme.bodySmall?.copyWith(color: _textMuted),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: controller.onAddMember,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: _purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Add Member',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined, color: _textMuted),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFFDBEAFE),
          child: Icon(Icons.person, color: _purple),
        ),
      ],
    );
  }

  Widget _buildSummaryCards() {
    final cards = [
      _SummaryCard(icon: Icons.people, iconColor: _purple, value: '284', label: 'Active Members'),
      _SummaryCard(icon: Icons.schedule, iconColor: Colors.orange, value: '18', label: 'Expiring (7 Days)'),
      _SummaryCard(icon: Icons.cancel_outlined, iconColor: Colors.red, value: '7', label: 'Expired'),
      _SummaryCard(icon: Icons.check_circle_outline, iconColor: Colors.green, value: '96', label: 'Renewed (This Month)'),
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
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(c.icon, color: c.iconColor, size: 28),
          const SizedBox(height: 12),
          Text(
            c.value,
            style: Get.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            c.label,
            style: Get.textTheme.bodySmall?.copyWith(color: _textMuted),
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
        color: _cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Action Required - Renewals',
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _textDark,
                  ),
                ),
                GestureDetector(
                  onTap: controller.onViewAllRenewals,
                  child: Text(
                    'View All Renewals',
                    style: Get.textTheme.bodyMedium?.copyWith(
                      color: _purple,
                      fontWeight: FontWeight.w500,
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
                decoration: BoxDecoration(color: _sidebarBg),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: isActions
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.notifications_none, size: 20, color: _textMuted),
                const SizedBox(width: 8),
                Icon(Icons.refresh, size: 20, color: _textMuted),
                const SizedBox(width: 8),
                Icon(Icons.visibility_outlined, size: 20, color: _textMuted),
              ],
            )
          : isBadge
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isExpired ? _expiredBadge : _expiringBadge,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    text,
                    style: Get.textTheme.labelSmall?.copyWith(
                      color: isExpired ? _expiredText : _expiringText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: isHeader ? _textMuted : _textDark,
                    fontWeight: isHeader ? FontWeight.w600 : null,
                  ),
                ),
    );
  }

  Widget _buildAiInsightsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Insights',
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'You may lose ₹18,000 this week due to 6 memberships expiring. Sending reminders today could recover ₹12,500.',
            style: Get.textTheme.bodyMedium?.copyWith(color: _textDark, height: 1.4),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: controller.onSendRemindersNow,
              style: TextButton.styleFrom(
                backgroundColor: _purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
        color: _cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Reminders',
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('John Doe', style: Get.textTheme.bodyMedium?.copyWith(color: _textDark)),
              Text('WhatsApp. 18:20:36', style: Get.textTheme.bodySmall?.copyWith(color: _textMuted)),
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
