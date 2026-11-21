import 'package:flutter/material.dart';

import 'login_primary_button.dart';

class LoginPhoneForm extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final VoidCallback onSubmit;

  const LoginPhoneForm({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nomor HP',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          enabled: !isLoading,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => onSubmit(),
          decoration: InputDecoration(
            hintText: 'Contoh: 081234567890',
            prefixIcon: const Icon(Icons.phone_android_rounded),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        const SizedBox(height: 24),
        LoginPrimaryButton(
          label: 'Kirim Kode OTP',
          icon: Icons.arrow_forward_rounded,
          isLoading: isLoading,
          onPressed: onSubmit,
        ),
      ],
    );
  }
}
