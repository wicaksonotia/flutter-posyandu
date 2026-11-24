import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:posyandu_app/modules/puskesmas/controllers/puskesmas_dashboard_controller.dart';
import 'package:posyandu_app/modules/puskesmas/widgets/puskesmas_info_card.dart';
import 'package:posyandu_app/modules/puskesmas/widgets/puskesmas_statistics.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_shimmer.dart';

import 'package:posyandu_app/app/theme/app_colors.dart';

class PuskesmasDashboardView extends GetView<PuskesmasDashboardController> {
  const PuskesmasDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(() {
          final data = controller.dashboard.value;
          final loading = controller.isLoading.value;
          final error = controller.errorMessage.value;

          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildHeader(),
                    const Gap(26),

                    _buildSectionTitle(
                      'Ringkasan Wilayah',
                      'Statistik wilayah kerja Puskesmas',
                    ),
                    const Gap(16),

                    if (loading && data == null)
                      const DashboardShimmer()
                    else if (error.isNotEmpty && data == null)
                      _buildError(error)
                    else if (data != null)
                      PuskesmasStatistics(data: data),

                    const Gap(24),

                    PuskesmasInfoCard(),
                  ]),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.local_hospital_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: controller.refreshDashboard,
                icon: const Icon(Icons.refresh_rounded, color: Colors.white),
                tooltip: 'Perbarui data',
              ),
            ],
          ),
          const Gap(18),
          const Text(
            'Dashboard Puskesmas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap(5),
          Text(
            'Puskesmas Gampengrejo',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on_outlined, size: 14, color: Colors.white),
                Gap(5),
                Text(
                  'Kecamatan Gampengrejo, Kediri',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const Gap(4),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildError(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.cloud_off_outlined,
            size: 35,
            color: AppColors.textSecondary,
          ),
          const Gap(10),
          const Text(
            'Data belum dapat dimuat',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(5),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
          const Gap(12),
          TextButton.icon(
            onPressed: controller.loadDashboard,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Coba lagi'),
          ),
        ],
      ),
    );
  }
}
