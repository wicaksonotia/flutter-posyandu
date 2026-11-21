import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_phone_info.dart';
import 'login_primary_button.dart';

class LoginOtpForm extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController otpController;
  final String? developmentOtp;
  final bool isLoading;
  final VoidCallback onVerify;
  final VoidCallback onBack;

  const LoginOtpForm({
    super.key,
    required this.phoneController,
    required this.otpController,
    required this.developmentOtp,
    required this.isLoading,
    required this.onVerify,
    required this.onBack,
  });

  Future<void> _copyOtp(BuildContext context) async {
    final otp = developmentOtp;
    if (otp == null || otp.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: otp));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text('Kode OTP berhasil disalin'),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _pasteOtp() async {
    final clipboard = await Clipboard.getData(Clipboard.kTextPlain);
    final value = clipboard?.text?.trim();

    if (value == null || value.isEmpty) return;

    final digits = value.replaceAll(RegExp(r'[^0-9]'), '');
    otpController.text = digits.length > 6 ? digits.substring(0, 6) : digits;
    otpController.selection = TextSelection.collapsed(
      offset: otpController.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginPhoneInfo(phone: phoneController.text.trim(), onChange: onBack),

        if (developmentOtp != null) ...[
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.colorScheme.tertiary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.developer_mode_rounded,
                  size: 28,
                  color: theme.colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OTP Development',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onTertiaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SelectableText(
                        developmentOtp!,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          color: theme.colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () => _copyOtp(context),
                  icon: const Icon(Icons.copy_rounded, size: 16),
                  label: const Text('Salin'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.onTertiaryContainer,
                    side: BorderSide(
                      color: theme.colorScheme.onTertiaryContainer.withValues(
                        alpha: 0.35,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kode OTP',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton.icon(
              onPressed: _pasteOtp,
              icon: const Icon(Icons.content_paste_rounded, size: 16),
              label: const Text('Tempel'),
            ),
          ],
        ),

        const SizedBox(height: 4),

        TextField(
          controller: otpController,
          keyboardType: TextInputType.number,
          maxLength: 6,
          enabled: !isLoading,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => onVerify(),
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 12,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '000000',
            counterText: '',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),

        const SizedBox(height: 24),

        LoginPrimaryButton(
          label: 'Verifikasi & Masuk',
          icon: Icons.verified_rounded,
          isLoading: isLoading,
          onPressed: onVerify,
        ),

        const SizedBox(height: 12),

        Center(
          child: TextButton.icon(
            onPressed: isLoading ? null : onBack,
            icon: const Icon(Icons.arrow_back_rounded, size: 18),
            label: const Text('Kembali ke nomor HP'),
          ),
        ),
      ],
    );
  }
}
