import 'package:flutter/material.dart';

import 'package:posyandu_app/shared/widgets/dashboard/dashboard_section_title.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_stat_card.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_stat_grid.dart';

import '../models/kader_dashboard_model.dart';

class KaderDashboardStatistics extends StatelessWidget {
  final KaderDashboardModel data;

  const KaderDashboardStatistics({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final statistics = data.statistics;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardSectionTitle(
          title: 'Aktivitas Pelayanan',
          subtitle: 'Ringkasan data Posyandu Anda',
        ),
        const SizedBox(height: 14),
        DashboardStatGrid(
          items: [
            DashboardStatCard(
              title: 'Total Warga',
              value: statistics.totalWarga.toString(),
              description: 'Warga terdaftar',
              icon: Icons.people_alt_rounded,
              color: const Color(0xFF1976D2),
            ),
            DashboardStatCard(
              title: 'Kegiatan',
              value: statistics.totalKegiatan.toString(),
              description: 'Total kegiatan',
              icon: Icons.event_note_rounded,
              color: const Color(0xFF26A69A),
            ),
            DashboardStatCard(
              title: 'Kunjungan Hari Ini',
              value: statistics.kunjunganHariIni.toString(),
              description: 'Kunjungan tercatat',
              icon: Icons.assignment_turned_in_rounded,
              color: const Color(0xFF8E65C5),
            ),
            DashboardStatCard(
              title: 'Antrean Menunggu',
              value: statistics.antreanMenunggu.toString(),
              description: 'Belum diperiksa',
              icon: Icons.hourglass_top_rounded,
              color: const Color(0xFFF39C35),
            ),
          ],
        ),
      ],
    );
  }
}
