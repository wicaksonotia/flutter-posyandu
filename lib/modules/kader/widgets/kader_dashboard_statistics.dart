import 'package:flutter/material.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_stats_panel.dart';

class KaderDashboardStatistics extends StatelessWidget {
  final int totalWarga;
  final int totalKegiatan;
  final int kunjunganHariIni;
  final int antreanMenunggu;

  const KaderDashboardStatistics({
    super.key,
    required this.totalWarga,
    required this.totalKegiatan,
    required this.kunjunganHariIni,
    required this.antreanMenunggu,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardStatsPanel(
      mode: DashboardStatsPanelMode.summary,
      total: totalWarga,
      totalTitle: 'Total Warga',
      totalSubtitle: 'Warga yang terdaftar',
      totalIcon: Icons.people_alt_rounded,
      chartTitle: 'Ringkasan Aktivitas',
      items: const [
        DashboardStatItem(
          title: 'Kegiatan',
          value: 0,
          color: Colors.blue,
          icon: Icons.event_available_rounded,
        ),
        DashboardStatItem(
          title: 'Kunjungan Hari Ini',
          value: 0,
          color: Colors.green,
          icon: Icons.people_alt_rounded,
        ),
        DashboardStatItem(
          title: 'Antrean Menunggu',
          value: 0,
          color: Colors.orange,
          icon: Icons.hourglass_top_rounded,
        ),
      ],
    );
  }
}
