import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_member_modal.dart';

enum MemberStatus { active, expired, expiring }

class _MemberRow {
  final String name;
  final String phone;
  final String plan;
  final String expiry;
  final MemberStatus status;

  _MemberRow({
    required this.name,
    required this.phone,
    required this.plan,
    required this.expiry,
    required this.status,
  });
}

/// Members page content: header, search/filters, table, pagination.
/// Used inside the dashboard main content area when Members nav is selected.
class MembersView extends StatelessWidget {
  const MembersView({super.key});

  static const _purple = Color(0xFF4F46E5);
  static const _textDark = Color(0xFF333333);
  static const _textMuted = Color(0xFF666666);
  static const _border = Color(0xFFE5E7EB);
  static const _iconCircleOrange = Color(0xFFF59E0B);
  static const _iconCircleRed = Color(0xFFDC2626);
  static const _iconCircleGreen = Color(0xFF16A34A);

  static final _tableData = [
    _MemberRow(
      name: 'Rahul Kamath',
      phone: '+91 98642 13565',
      plan: 'Yearly',
      expiry: '08/07/2027',
      status: MemberStatus.active,
    ),
    _MemberRow(
      name: 'Mithun Shetty',
      phone: '+91 98642 13565',
      plan: 'Quarterly',
      expiry: '31/12/2025',
      status: MemberStatus.expiring,
    ),
    _MemberRow(
      name: 'Vishal AV',
      phone: '+91 98642 13565',
      plan: 'Monthly',
      expiry: '02/02/2026',
      status: MemberStatus.expired,
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
          _buildSearchRow(),
          const SizedBox(height: 16),
          _buildTable(),
          const SizedBox(height: 16),
          _buildPagination(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Members',
              style: Get.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: _textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Manage all your members and their subscriptions',
              style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
            ),
          ],
        ),
        FilledButton(
          onPressed: () => Get.dialog(const AddMemberModal()),
          style: FilledButton.styleFrom(
            backgroundColor: _purple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Add Member'),
        ),
      ],
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
        _buildDropdown('Sort'),
        const SizedBox(width: 12),
        _buildDropdown('Plan'),
        const SizedBox(width: 12),
        TextButton(
          onPressed: () {},
          child: Text(
            'Clear Filters',
            style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label) {
    return Container(
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
            label,
            style: Get.textTheme.bodyMedium?.copyWith(color: _textDark),
          ),
          const SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down, size: 20, color: _textMuted),
        ],
      ),
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
          0: FlexColumnWidth(1.8),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1.2),
          4: FlexColumnWidth(1),
          5: FlexColumnWidth(1.2),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: Color(0xFFF1F5F9)),
            children: [
              _tableCell('Name', isHeader: true),
              _tableCell('Phone Number', isHeader: true),
              _tableCell('Plan', isHeader: true),
              _tableCell('Expiry Date', isHeader: true),
              _tableCell('Status', isHeader: true),
              _tableCell('Action', isHeader: true),
            ],
          ),
          ..._tableData.map(
            (row) => TableRow(
              decoration: BoxDecoration(color: Colors.white),
              children: [
                _tableCell(row.name),
                _tableCell(row.phone),
                _tableCell(row.plan),
                _tableCell(row.expiry),
                _tableCell(_statusPill(row.status)),
                _tableCell(_actionIcons()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableCell(dynamic content, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Align(
        alignment: Alignment.centerLeft,
        child: content is String
            ? Text(
                content as String,
                style: Get.textTheme.bodySmall?.copyWith(
                  fontWeight: isHeader ? FontWeight.w600 : FontWeight.normal,
                  color: _textDark,
                  fontSize: 14,
                ),
              )
            : content as Widget,
      ),
    );
  }

  Widget _statusPill(MemberStatus status) {
    final (String label, Color bg) = switch (status) {
      MemberStatus.active => ('Active', _iconCircleGreen),
      MemberStatus.expired => ('Expired', _iconCircleRed),
      MemberStatus.expiring => ('Expiring', _iconCircleOrange),
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
        _actionIcon(Icons.edit_outlined),
        _actionIcon(Icons.delete_outline),
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

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Showing 1-10 of 248 members',
          style: Get.textTheme.bodySmall?.copyWith(
            color: _textMuted,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 24),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(40, 40),
            padding: EdgeInsets.zero,
            side: BorderSide(color: _border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Icon(Icons.chevron_left, color: _textMuted, size: 20),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: _purple,
            minimumSize: const Size(40, 40),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Icon(Icons.chevron_right, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}
