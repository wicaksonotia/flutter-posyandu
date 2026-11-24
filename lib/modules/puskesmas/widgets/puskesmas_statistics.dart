import 'package:flutter/material.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_stat_card.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_stat_grid.dart';

import '../models/puskesmas_dashboard_model.dart';

class PuskesmasStatistics extends StatelessWidget {
  final PuskesmasDashboardModel data;

  const PuskesmasStatistics({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return DashboardStatGrid(
      items: [
        DashboardStatCard(
          title: 'Desa',
          value: data.totalDesa.toString(),
          description: 'Wilayah kerja',
          icon: Icons.location_city_rounded,
          color: const Color(0xFF1976D2),
        ),
        DashboardStatCard(
          title: 'Posyandu',
          value: data.totalPosyandu.toString(),
          description: 'Unit pelayanan',
          icon: Icons.health_and_safety_rounded,
          color: const Color(0xFF26A69A),
        ),
        DashboardStatCard(
          title: 'Warga',
          value: data.totalWarga.toString(),
          description: 'Terdaftar',
          icon: Icons.people_alt_rounded,
          color: const Color(0xFF8E65C5),
        ),
        DashboardStatCard(
          title: 'Kegiatan',
          value: data.totalKegiatan.toString(),
          description: 'Tercatat',
          icon: Icons.event_note_rounded,
          color: const Color(0xFFF39C35),
        ),
      ],
    );
  }
}
