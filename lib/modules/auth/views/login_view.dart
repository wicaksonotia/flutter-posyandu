import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/modules/auth/controllers/auth_controller.dart';
import 'package:posyandu_app/modules/auth/widgets/login_brand.dart';
import 'package:posyandu_app/modules/auth/widgets/login_error_message.dart';
import 'package:posyandu_app/modules/auth/widgets/login_otp_form.dart';
import 'package:posyandu_app/modules/auth/widgets/login_phone_form.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 32),

                    const LoginBrand(),

                    const SizedBox(height: 36),

                    if (!controller.isOtpStep.value)
                      LoginPhoneForm(
                        controller: controller.phoneController,
                        isLoading: controller.isLoading.value,
                        onSubmit: controller.requestOtp,
                      )
                    else
                      LoginOtpForm(
                        phoneController: controller.phoneController,
                        otpController: controller.otpController,
                        developmentOtp: controller.developmentOtp.value,
                        isLoading: controller.isLoading.value,
                        onVerify: controller.verifyOtp,
                        onBack: controller.backToPhone,
                      ),

                    if (controller.errorMessage.value.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      LoginErrorMessage(message: controller.errorMessage.value),
                    ],

                    const SizedBox(height: 32),

                    Text(
                      'Posyandu Digital',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
