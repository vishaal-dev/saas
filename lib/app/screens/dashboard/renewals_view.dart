import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RenewalStatus { expiring, expired, renewed }

class _RenewalRow {
  final String name;
  final String phone;
  final String expiryDate;
  final int daysLeft;
  final String plan;
  final RenewalStatus status;
  final String lastReminder;

  _RenewalRow({
    required this.name,
    required this.phone,
    required this.expiryDate,
    required this.daysLeft,
    required this.plan,
    required this.status,
    required this.lastReminder,
  });
}

/// Renewals page content: header, status tabs, search/filters, table.
/// Used inside the dashboard main content area when Renewals nav is selected.
class RenewalsView extends StatefulWidget {
  const RenewalsView({super.key});

  @override
  State<RenewalsView> createState() => _RenewalsViewState();
}

class _RenewalsViewState extends State<RenewalsView> {
  static const _purple = Color(0xFF4F46E5);
  static const _textDark = Color(0xFF333333);
  static const _textMuted = Color(0xFF666666);
  static const _border = Color(0xFFE5E7EB);
  static const _iconCircleOrange = Color(0xFFF59E0B);
  static const _iconCircleRed = Color(0xFFDC2626);

  int _selectedTabIndex = 0;
  static const _statusTabs = ['All', 'Expiring Soon', 'Expired', 'Renewed'];

  static final _tableData = [
    _RenewalRow(
      name: 'Vishal A V',
      phone: '+91 98642 13565',
      expiryDate: '15/02/2026',
      daysLeft: 7,
      plan: 'Monthly',
      status: RenewalStatus.expiring,
      lastReminder: 'WhatsApp. Yesterday',
    ),
    _RenewalRow(
      name: 'Rahul Kamath',
      phone: '+91 98642 13565',
      expiryDate: '01/01/2026',
      daysLeft: 0,
      plan: 'Quarterly',
      status: RenewalStatus.expired,
      lastReminder: 'SMS. 1 Month back',
    ),
    _RenewalRow(
      name: 'Vishal A V',
      phone: '+91 98642 13565',
      expiryDate: '15/02/2026',
      daysLeft: 7,
      plan: 'Monthly',
      status: RenewalStatus.expiring,
      lastReminder: 'WhatsApp. Yesterday',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildStatusTabs(),
          const SizedBox(height: 16),
          _buildSearchRow(),
          const SizedBox(height: 16),
          _buildTable(),
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
          'Renewals',
          style: Get.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: _textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Track and manage upcoming and missed renewals',
          style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
        ),
      ],
    );
  }

  Widget _buildStatusTabs() {
    return Row(
      children: List.generate(_statusTabs.length, (i) {
        final isActive = _selectedTabIndex == i;
        return Padding(
          padding: EdgeInsets.only(right: i < _statusTabs.length - 1 ? 8 : 0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => setState(() => _selectedTabIndex = i),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isActive ? _purple : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isActive ? _purple : _border,
                  ),
                ),
                child: Text(
                  _statusTabs[i],
                  style: Get.textTheme.bodyMedium?.copyWith(
                    color: isActive ? Colors.white : _textMuted,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _border),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name or phone number',
                hintStyle: TextStyle(color: _textMuted, fontSize: 14),
                prefixIcon: Icon(Icons.search, size: 22, color: _textMuted),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_today_outlined, size: 20, color: _textMuted),
              const SizedBox(width: 8),
              Text(
                'Select Dates',
                style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Plan',
                style: Get.textTheme.bodyMedium?.copyWith(color: _textDark),
              ),
              const SizedBox(width: 8),
              Icon(Icons.keyboard_arrow_down, size: 20, color: _textMuted),
            ],
          ),
        ),
        const SizedBox(width: 12),
        TextButton(
          onPressed: () {},
          child: Text(
            'Clear Filters',
            style: Get.textTheme.bodyMedium?.copyWith(
              color: _purple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1.2),
          1: FlexColumnWidth(1.3),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(0.8),
          4: FlexColumnWidth(0.9),
          5: FlexColumnWidth(1),
          6: FlexColumnWidth(1.5),
          7: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: Color(0xFF64748B)),
            children: [
              _tableCell('Name', isHeader: true, headerStyle: true),
              _tableCell('Phone Number', isHeader: true, headerStyle: true),
              _tableCell('Expiry Date', isHeader: true, headerStyle: true),
              _tableCell('Days Left', isHeader: true, headerStyle: true),
              _tableCell('Plan', isHeader: true, headerStyle: true),
              _tableCell('Status', isHeader: true, headerStyle: true),
              _tableCell('Last Reminder', isHeader: true, headerStyle: true),
              _tableCell('Action', isHeader: true, headerStyle: true),
            ],
          ),
          ..._tableData.map(
            (row) => TableRow(
              decoration: BoxDecoration(color: Colors.white),
              children: [
                _tableCell(row.name),
                _tableCell(row.phone),
                _tableCell(row.expiryDate),
                _tableCell(
                  Text(
                    '${row.daysLeft}',
                    style: Get.textTheme.bodySmall?.copyWith(
                      color: row.daysLeft == 0 ? _iconCircleRed : _textDark,
                      fontWeight: row.daysLeft == 0 ? FontWeight.w600 : null,
                      fontSize: 14,
                    ),
                  ),
                ),
                _tableCell(row.plan),
                _tableCell(_statusPill(row.status)),
                _tableCell(row.lastReminder),
                _tableCell(_actionIcons()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableCell(dynamic content,
      {bool isHeader = false, bool headerStyle = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Align(
        alignment: Alignment.centerLeft,
        child: content is String
            ? Text(
                content as String,
                style: Get.textTheme.bodySmall?.copyWith(
                  fontWeight: isHeader ? FontWeight.w600 : FontWeight.normal,
                  color: headerStyle ? Colors.white : _textDark,
                  fontSize: 14,
                ),
              )
            : content as Widget,
      ),
    );
  }

  Widget _statusPill(RenewalStatus status) {
    final (String label, Color bg) = switch (status) {
      RenewalStatus.expiring => ('Expiring', _iconCircleOrange),
      RenewalStatus.expired => ('Expired', _iconCircleRed),
      RenewalStatus.renewed => ('Renewed', Color(0xFF16A34A)),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Get.textTheme.bodySmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _actionIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _actionIcon(Icons.visibility_outlined),
        _actionIcon(Icons.refresh),
        _actionIcon(Icons.notifications_outlined),
      ],
    );
  }

  Widget _actionIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Icon(icon, size: 18, color: _textMuted),
          ),
        ),
      ),
    );
  }
}
