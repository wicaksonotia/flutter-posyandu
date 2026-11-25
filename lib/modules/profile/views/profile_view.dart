import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:posyandu_app/app/theme/app_colors.dart';
import 'package:posyandu_app/modules/profile/controllers/profile_controller.dart';
import 'package:posyandu_app/shared/utils/confirm_logout_dialog.dart';
import 'package:posyandu_app/shared/widgets/profile/profile_header_card.dart';
import 'package:posyandu_app/shared/widgets/profile/profile_info_card.dart';
import 'package:posyandu_app/shared/widgets/profile/profile_info_tile.dart';
import 'package:posyandu_app/shared/widgets/profile/profile_logout_button.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.profile.isEmpty) {
          return const _ProfileLoading();
        }

        if (controller.errorMessage.value.isNotEmpty &&
            controller.profile.isEmpty) {
          return _ProfileError(
            message: controller.errorMessage.value,
            onRetry: controller.loadProfile,
          );
        }

        return RefreshIndicator(
          onRefresh: controller.loadProfile,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ProfileHeaderCard(name: controller.name, role: controller.role),
              const Gap(20),

              const Text(
                'Informasi Akun',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Gap(10),

              ProfileInfoCard(
                title: 'Data Pengguna',
                children: [
                  ProfileInfoTile(
                    title: 'Nama Lengkap',
                    value: controller.name,
                    icon: Icons.person_outline_rounded,
                  ),
                  const Divider(height: 1),
                  ProfileInfoTile(
                    title: 'Nomor Telepon',
                    value: controller.phone,
                    icon: Icons.phone_outlined,
                  ),
                  const Divider(height: 1),
                  ProfileInfoTile(
                    title: 'Email',
                    value: controller.email,
                    icon: Icons.email_outlined,
                  ),
                  const Divider(height: 1),
                  ProfileInfoTile(
                    title: 'Peran',
                    value: controller.role,
                    icon: Icons.badge_outlined,
                  ),
                ],
              ),

              const Gap(24),

              Obx(
                () => ProfileLogoutButton(
                  isLoading: controller.isLoggingOut.value,
                  onTap: () {
                    ConfirmLogoutDialog.show(
                      context,
                      onConfirm: controller.logout,
                    );
                  },
                ),
              ),

              const Gap(20),
              const Center(
                child: Text(
                  'Posyandu App',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        );
      }),
    );
  }
}

class _ProfileLoading extends StatelessWidget {
  const _ProfileLoading();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [_skeleton(height: 110), const Gap(20), _skeleton(height: 220)],
    );
  }

  Widget _skeleton({required double height}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}

class _ProfileError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ProfileError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cloud_off_outlined,
              size: 40,
              color: AppColors.textSecondary,
            ),
            const Gap(12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
            const Gap(12),
            OutlinedButton(onPressed: onRetry, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }
}
