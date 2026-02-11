import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _ReminderRuleRow {
  final String trigger;
  final String timing;
  final String audience;
  final bool isActive;

  _ReminderRuleRow({
    required this.trigger,
    required this.timing,
    required this.audience,
    this.isActive = true,
  });
}

/// Reminders page content: header, Reminder Rules table, Message Templates table.
/// Used inside the dashboard main content area when Reminders nav is selected.
class RemindersView extends StatelessWidget {
  const RemindersView({super.key});

  static const _purple = Color(0xFF4F46E5);
  static const _textDark = Color(0xFF333333);
  static const _textMuted = Color(0xFF666666);
  static const _border = Color(0xFFE5E7EB);
  static const _iconCircleGreen = Color(0xFF16A34A);
  static const _whatsAppGreen = Color(0xFF25D366);
  static const _emailBlue = Color(0xFF2196F3);

  static final _reminderRulesData = [
    _ReminderRuleRow(
      trigger: 'Before Expiry',
      timing: '7 Days before',
      audience: 'All Members',
    ),
  ];

  static final _messageTemplatesData = [
    _ReminderRuleRow(
      trigger: 'Before Expiry',
      timing: '7 Days before',
      audience: 'All Members',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildReminderRulesSection(),
          const SizedBox(height: 28),
          _buildMessageTemplatesSection(),
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
              'Reminders',
              style: Get.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: _textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Automate renewal reminders across WhatsApp and Email',
              style: Get.textTheme.bodyMedium?.copyWith(color: _textMuted),
            ),
          ],
        ),
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: _purple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Create Reminder Rule'),
        ),
      ],
    );
  }

  Widget _buildReminderRulesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reminder Rules',
          style: Get.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: _textDark,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Define when and how reminders are sent automatically',
          style: Get.textTheme.bodySmall?.copyWith(color: _textMuted),
        ),
        const SizedBox(height: 16),
        _buildRulesTable(_reminderRulesData),
      ],
    );
  }

  Widget _buildMessageTemplatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Message Templates',
                  style: Get.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _textDark,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Customize the message sent to members.',
                  style: Get.textTheme.bodySmall?.copyWith(color: _textMuted),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: _textDark,
                side: BorderSide(color: _border),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Create Template'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildRulesTable(_messageTemplatesData),
      ],
    );
  }

  Widget _buildRulesTable(List<_ReminderRuleRow> rows) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1.2),
          1: FlexColumnWidth(1.2),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1.2),
          4: FlexColumnWidth(0.9),
          5: FlexColumnWidth(0.9),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: Color(0xFFF1F5F9)),
            children: [
              _tableCell('Trigger', isHeader: true),
              _tableCell('Timing', isHeader: true),
              _tableCell('Channel', isHeader: true),
              _tableCell('Audience', isHeader: true),
              _tableCell('Status', isHeader: true),
              _tableCell('Action', isHeader: true),
            ],
          ),
          ...rows.map(
            (row) => TableRow(
              decoration: BoxDecoration(color: Colors.white),
              children: [
                _tableCell(row.trigger),
                _tableCell(row.timing),
                _tableCell(_channelIcons()),
                _tableCell(row.audience),
                _tableCell(_statusPill(row.isActive)),
                _tableCell(_actionIcons()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _channelIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.chat_bubble_outline, size: 20, color: _whatsAppGreen),
        const SizedBox(width: 8),
        Icon(Icons.email_outlined, size: 20, color: _emailBlue),
      ],
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

  Widget _statusPill(bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFDCFCE7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Active',
        style: Get.textTheme.bodySmall?.copyWith(
          color: _iconCircleGreen,
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
}
