import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  static const _sidebarWidth = 264.0;
  static const _sidebarHeight = 900.0;
  static const _menuContentWidth = 220.0;

  // Design colors (exact from image)
  static const _purple = Color(0xFF4F46E5);
  static const _purpleLight = Color(0xFFEEEDFB); // Active nav background
  static const _textDark = Color(0xFF333333);
  static const _textMuted = Color(0xFF666666);
  static const _border = Color(0xFFE5E7EB);
  static const _expiredBadge = Color(0xFFF87A7A);
  static const _expiringBadge = Color(0xFFFFB020);
  static const _renewedGreen = Color(0xFF5AC464);
  static const _iconCirclePurple = Color(0xFF4F46E5);
  static const _iconCircleOrange = Color(0xFFF59E0B);
  static const _iconCircleRed = Color(0xFFDC2626);
  static const _iconCircleGreen = Color(0xFF16A34A);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildSidebar(context),
              Expanded(child: _buildMainContent(context)),
            ],
          ),
          // _buildFooter(),
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
        style: Get.textTheme.bodySmall?.copyWith(
          color: _textMuted,
          fontSize: 12,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  static const _menuIcons = (
    dashboard: 'assets/icons/dashboard.png',
    members: 'assets/icons/users-round.png',
    subscriptions: 'assets/icons/calendar-days.png',
    renewals: 'assets/icons/calendar-sync.png',
    reminders: 'assets/icons/bell-ring.png',
    reports: 'assets/icons/chart-column-big.png',
    settings: 'assets/icons/settings.png',
  );

  Widget _buildSidebar(BuildContext context) {
    final navItems = [
      _NavItem(
        iconPath: _menuIcons.dashboard,
        label: 'Dashboard',
        isActive: true,
      ),
      _NavItem(iconPath: _menuIcons.members, label: 'Members'),
      _NavItem(iconPath: _menuIcons.subscriptions, label: 'Subscriptions'),
      _NavItem(iconPath: _menuIcons.renewals, label: 'Renewals'),
      _NavItem(iconPath: _menuIcons.reminders, label: 'Reminders'),
      _NavItem(iconPath: _menuIcons.reports, label: 'Reports'),
      _NavItem(iconPath: _menuIcons.settings, label: 'Settings'),
    ];
    return Container(
      width: _sidebarWidth,
      height: _sidebarHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        // border: Border(right: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Center(
              child: SizedBox(
                width: _menuContentWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/saas-logo.png',
                            height: 36,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ...navItems.map((e) => _buildNavTile(e)),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: InkWell(
                        onTap: controller.onLogout,
                        borderRadius: BorderRadius.circular(28),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Logout',
                                style: Get.textTheme.bodyMedium?.copyWith(
                                  color: _textMuted,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: _textMuted,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
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
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: item.isActive ? _purpleLight : Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        child: InkWell(
          onTap: () => controller.onNavTap(0),
          borderRadius: BorderRadius.circular(28),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
            child: Row(
              children: [
                Image.asset(
                  item.iconPath,
                  width: 24,
                  height: 24,
                  color: item.isActive ? _purple : _textMuted,
                  colorBlendMode: BlendMode.srcIn,
                ),
                const SizedBox(width: 16),
                Text(
                  item.label,
                  style: Get.textTheme.bodySmall?.copyWith(
                    fontSize: 18,
                    color: item.isActive ? _purple : _textMuted,
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildTopBar()],
          ),
          const SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
            ),
            child: Column(children: [_buildSummaryCards()]),
          ),
          const SizedBox(height: 24),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Expanded(flex: 2, child: _buildRenewalsSection()),
          //     const SizedBox(width: 24),
          //     SizedBox(
          //       width: 340,
          //       child: Column(
          //         children: [
          //           _buildAiInsightsCard(),
          //           const SizedBox(height: 20),
          //           _buildUpcomingRemindersCard(),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFEEF2FF),
          child: Image.asset(
            'assets/icons/headset.png',
            width: 24,
            height: 24,
            color: _textMuted,
            colorBlendMode: BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 32),
        CircleAvatar(
          backgroundColor: const Color(0xFFEEF2FF),
          child: Image.asset('assets/images/profile-icon.png'),
        ),
      ],
    );
  }

  Widget _buildSummaryCards() {
    final cards = [
      _SummaryCard(
        iconPath: 'assets/icons/users.png',
        iconColor: Colors.white,
        circleBg: _iconCirclePurple,
        value: '284',
        valueColor: Colors.black,
        label: 'Active Members',
      ),
      _SummaryCard(
        iconPath: 'assets/icons/alarm-clock.png',
        iconColor: Colors.white,
        circleBg: _iconCircleOrange,
        value: '18',
        valueColor: Colors.black,
        label: 'Expiring (7 Days)',
      ),
      _SummaryCard(
        iconPath: 'assets/icons/shield-x.png',
        iconColor: Colors.white,
        circleBg: _iconCircleRed,
        value: '7',
        valueColor: Colors.black,
        label: 'Expired',
      ),
      _SummaryCard(
        iconPath: 'assets/icons/book-check.png',
        iconColor: Colors.white,
        circleBg: _iconCircleGreen,
        value: '96',
        valueColor: Colors.black,
        label: 'Renewed (This Month)',
      ),
    ];
    return Row(
      children: [
        for (int i = 0; i < cards.length; i++)
          Padding(
            padding: EdgeInsets.only(right: i < cards.length - 1 ? 25 : 0),
            child: _summaryCard(cards[i]),
          ),
      ],
    );
  }

  Widget _summaryCard(_SummaryCard c) {
    return Container(
      height: 120,
      width: 264,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: c.circleBg,
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              c.iconPath,
              width: 24,
              height: 24,
              color: c.iconColor,
              colorBlendMode: BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                c.value,
                style: Get.textTheme.bodyLarge?.copyWith(
                  color: c.valueColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                c.label,
                style: Get.textTheme.bodySmall?.copyWith(
                  color: _textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRenewalsSection() {
    final rows = [
      _RenewalRow(
        name: 'Rahul Kamath',
        plan: 'Quarterly',
        expiry: '01/01/2026',
        status: 'Expired',
        isExpired: true,
      ),
      _RenewalRow(
        name: 'Lina Benny Thomas',
        plan: 'Monthly',
        expiry: '15/01/2026',
        status: 'Expiring',
        isExpired: false,
      ),
      _RenewalRow(
        name: 'Ankith Rawat',
        plan: 'Yearly',
        expiry: '15/01/2026',
        status: 'Expiring',
        isExpired: false,
      ),
      _RenewalRow(
        name: 'Alex George',
        plan: 'Monthly',
        expiry: '15/01/2026',
        status: 'Expiring',
        isExpired: false,
      ),
      _RenewalRow(
        name: 'Mary Steenberg',
        plan: 'Yearly',
        expiry: '15/01/2026',
        status: 'Expiring',
        isExpired: false,
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
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
                    fontWeight: FontWeight.w600,
                    color: _textDark,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
                GestureDetector(
                  onTap: controller.onViewAllRenewals,
                  child: Text(
                    'View All Renewals',
                    style: Get.textTheme.bodyMedium?.copyWith(
                      color: _purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Poppins',
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
                decoration: const BoxDecoration(color: Colors.white),
                children: [
                  _tableCell('Name', isHeader: true),
                  _tableCell('Plan', isHeader: true),
                  _tableCell('Expiry', isHeader: true),
                  _tableCell('Status', isHeader: true),
                  _tableCell('Action', isHeader: true),
                ],
              ),
              ...rows.asMap().entries.map(
                (e) => TableRow(
                  decoration: BoxDecoration(
                    color: e.key.isEven
                        ? Colors.white
                        : const Color(0xFFFAFAFA),
                  ),
                  children: [
                    _tableCell(e.value.name),
                    _tableCell(e.value.plan),
                    _tableCell(e.value.expiry),
                    _tableCell(
                      e.value.status,
                      isBadge: true,
                      isExpired: e.value.isExpired,
                    ),
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

  Widget _tableCell(
    String text, {
    bool isHeader = false,
    bool isBadge = false,
    bool isExpired = false,
    bool isActions = false,
  }) {
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
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                text,
                style: Get.textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                ),
              ),
            )
          : Text(
              text,
              style: Get.textTheme.bodySmall?.copyWith(
                color: isHeader ? _textDark : _textDark,
                fontWeight: isHeader ? FontWeight.w500 : FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
    );
  }

  Widget _actionIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
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
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Insights',
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: _textDark,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'You may lose ₹18,000 this week due to 6 memberships expiring. Sending reminders today could recover ₹12,500.',
            style: Get.textTheme.bodyMedium?.copyWith(
              color: _textMuted,
              height: 1.5,
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: controller.onSendRemindersNow,
              style: OutlinedButton.styleFrom(
                foregroundColor: _purple,
                side: const BorderSide(color: _purple),
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Send Reminders Now',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
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
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Reminders',
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: _textDark,
              fontSize: 18,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'John Doe',
                style: Get.textTheme.bodyMedium?.copyWith(
                  color: _textDark,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                'WhatsApp . 18:20:36',
                style: Get.textTheme.bodySmall?.copyWith(
                  color: _textMuted,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final String iconPath;
  final String label;
  final bool isActive;

  _NavItem({
    required this.iconPath,
    required this.label,
    this.isActive = false,
  });
}

class _SummaryCard {
  final String iconPath;
  final Color iconColor;
  final Color circleBg;
  final String value;
  final Color valueColor;
  final String label;

  _SummaryCard({
    required this.iconPath,
    required this.iconColor,
    required this.circleBg,
    required this.value,
    required this.valueColor,
    required this.label,
  });
}

class _RenewalRow {
  final String name;
  final String plan;
  final String expiry;
  final String status;
  final bool isExpired;

  _RenewalRow({
    required this.name,
    required this.plan,
    required this.expiry,
    required this.status,
    required this.isExpired,
  });
}
