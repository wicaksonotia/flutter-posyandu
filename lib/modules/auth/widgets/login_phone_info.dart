import 'package:flutter/material.dart';

class LoginPhoneInfo extends StatelessWidget {
  final String phone;
  final VoidCallback onChange;

  const LoginPhoneInfo({
    super.key,
    required this.phone,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.55,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(Icons.phone_android_rounded, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  phone,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Nomor HP tujuan verifikasi',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          TextButton(onPressed: onChange, child: const Text('Ubah')),
        ],
      ),
    );
  }
}
