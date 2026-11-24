import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:posyandu_app/app/theme/app_colors.dart';
import 'package:posyandu_app/modules/kader/controllers/kader_dashboard_controller.dart';
import 'package:posyandu_app/modules/kader/widgets/kader_dashboard_hero.dart';
import 'package:posyandu_app/modules/kader/widgets/kader_dashboard_statistics.dart';
import 'package:posyandu_app/modules/kader/widgets/kader_posyandu_section.dart';

import 'package:posyandu_app/shared/widgets/dashboard/dashboard_shimmer.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_error.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_empty_state.dart';

class KaderDashboardView extends GetView<KaderDashboardController> {
  const KaderDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(() {
          final data = controller.dashboard.value;

          if (controller.isLoading.value && data == null) {
            return const SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: DashboardShimmer(),
            );
          }

          if (controller.errorMessage.value.isNotEmpty && data == null) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: DashboardError(
                message: controller.errorMessage.value,
                onRetry: controller.loadDashboard,
              ),
            );
          }

          if (data == null) {
            return const DashboardEmptyState(
              title: 'Data tidak tersedia',
              message: 'Belum ada data dashboard yang dapat ditampilkan.',
            );
          }

          return RefreshIndicator(
            onRefresh: controller.refreshDashboard,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const KaderDashboardHero(),
                      const SizedBox(height: 26),
                      KaderDashboardStatistics(data: data),
                      const SizedBox(height: 26),
                      KaderPosyanduSection(data: data),
                    ]),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
