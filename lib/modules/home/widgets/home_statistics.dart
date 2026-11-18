import 'package:flutter/material.dart';
import 'package:posyandu_app/app/theme/app_colors.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_stats_panel.dart';

class HomeStatistics extends StatelessWidget {
  const HomeStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardStatsPanel(
      total: 1250,
      totalTitle: 'Total Warga',
      totalSubtitle: 'Seluruh warga terdaftar',
      chartTitle: 'Distribusi Kelompok Usia',
      items: [
        DashboardStatItem(
          title: 'Balita',
          value: 250,
          color: AppColors.statBalita,
        ),
        DashboardStatItem(title: 'Anak', value: 180, color: AppColors.statAnak),
        DashboardStatItem(
          title: 'Remaja',
          value: 220,
          color: AppColors.statRemaja,
        ),
        DashboardStatItem(
          title: 'Dewasa',
          value: 400,
          color: AppColors.statDewasa,
        ),
        DashboardStatItem(
          title: 'Lansia',
          value: 200,
          color: AppColors.statLansia,
        ),
      ],
    );
  }
}
