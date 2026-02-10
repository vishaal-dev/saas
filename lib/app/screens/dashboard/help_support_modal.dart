import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/widgets/auth_constants.dart';
import '../authentication/widgets/auth_form_field_section.dart';

class HelpSupportModal extends StatefulWidget {
  const HelpSupportModal({super.key});

  @override
  State<HelpSupportModal> createState() => _HelpSupportModalState();
}

class _HelpSupportModalState extends State<HelpSupportModal> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const Divider(thickness: 1, height: 1, color: Color(0xFFCBD5E1)),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(32, 20, 32, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To resolve any issues or queries, send us your concern by typing down below or contact us at the give phone number.',
                      style: Get.theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF334155),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AuthFormFieldSection(
                      label: 'Message here',
                      spacingAfterLabel: 8,
                      child: TextField(
                        controller: _messageController,
                        maxLines: 5,
                        style: Get.theme.textTheme.bodySmall?.copyWith(
                          color: AuthConstants.textColor,
                        ),
                        cursorColor: AuthConstants.textColor,
                        decoration: InputDecoration(
                          hintText: 'Your Query here....',
                          hintStyle: Get.theme.textTheme.labelMedium?.copyWith(
                            color: AuthConstants.hintColor,
                          ),
                          filled: true,
                          fillColor: AuthConstants.cardBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AuthConstants.fieldBorderRadius,
                            ),
                            borderSide: const BorderSide(
                              color: AuthConstants.borderColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AuthConstants.fieldBorderRadius,
                            ),
                            borderSide: const BorderSide(
                              color: AuthConstants.borderColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AuthConstants.fieldBorderRadius,
                            ),
                            borderSide: const BorderSide(
                              color: AuthConstants.focusedBorderColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
                            foregroundColor: AuthConstants.supportTextColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AuthConstants.fieldBorderRadius,
                              ),
                              side: const BorderSide(
                                color: AuthConstants.borderColor,
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 146,
                          height: 44,
                          child: FilledButton(
                            onPressed: () {
                              // TODO: send message
                              Navigator.of(context).pop();
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor:
                                  AuthConstants.buttonEnabledColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Send'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Center(
                      child: Text(
                        'Contact Us: +91 87564 56478 , +91 95784 12456',
                        style: Get.theme.textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF334155),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 48),
          Expanded(
            child: Center(
              child: Text(
                'Help & Support',
                style: Get.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AuthConstants.labelColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                size: 20,
                color: AuthConstants.hintColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
