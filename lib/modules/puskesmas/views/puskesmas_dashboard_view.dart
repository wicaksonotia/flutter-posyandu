import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import 'package:posyandu_app/app/theme/app_colors.dart';

import '../controllers/puskesmas_dashboard_controller.dart';
import '../models/puskesmas_dashboard_model.dart';

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
                      const _DashboardShimmer()
                    else if (error.isNotEmpty && data == null)
                      _buildError(error)
                    else if (data != null)
                      _buildStatistics(data),

                    const Gap(24),

                    _buildInfoCard(),
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

  Widget _buildStatistics(PuskesmasDashboardModel data) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'Desa',
                value: data.totalDesa,
                subtitle: 'Wilayah kerja',
                icon: Icons.location_city_rounded,
                color: const Color(0xFF1976D2),
              ),
            ),
            const Gap(12),
            Expanded(
              child: _StatCard(
                title: 'Posyandu',
                value: data.totalPosyandu,
                subtitle: 'Unit pelayanan',
                icon: Icons.health_and_safety_rounded,
                color: const Color(0xFF26A69A),
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'Warga',
                value: data.totalWarga,
                subtitle: 'Terdaftar',
                icon: Icons.people_alt_rounded,
                color: const Color(0xFF8E65C5),
              ),
            ),
            const Gap(12),
            Expanded(
              child: _StatCard(
                title: 'Kegiatan',
                value: data.totalKegiatan,
                subtitle: 'Tercatat',
                icon: Icons.event_note_rounded,
                color: const Color(0xFFF39C35),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, color: AppColors.primary, size: 21),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Wilayah',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Gap(5),
                Text(
                  'Data statistik mencakup seluruh desa dan Posyandu '
                  'yang terdaftar dalam wilayah kerja Puskesmas.',
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.5,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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

class _StatCard extends StatelessWidget {
  final String title;
  final int value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 21),
          ),
          const Gap(17),
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 27,
              height: 1.1,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(3),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardShimmer extends StatelessWidget {
  const _DashboardShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE9EEF4),
      highlightColor: Colors.white,
      child: Column(
        children: List.generate(2, (row) {
          return Padding(
            padding: EdgeInsets.only(bottom: row == 0 ? 12 : 0),
            child: Row(
              children: List.generate(2, (column) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: column == 0 ? 6 : 0,
                      left: column == 1 ? 6 : 0,
                    ),
                    child: Container(
                      height: 157,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
