import 'package:flutter/material.dart';

import 'package:posyandu_app/shared/widgets/dashboard/dashboard_hero_card.dart';

class PuskesmasDashboardHero extends StatelessWidget {
  final VoidCallback onRefresh;

  const PuskesmasDashboardHero({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return DashboardHeroCard(
      title: 'Puskesmas Gampengrejo',
      subtitle: 'Kecamatan Gampengrejo, Kediri',
      badge: 'Dashboard Puskesmas',
      icon: Icons.local_hospital_rounded,
      trailing: IconButton(
        onPressed: onRefresh,
        tooltip: 'Muat ulang dashboard',
        style: IconButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: 0.16),
          foregroundColor: Colors.white,
        ),
        icon: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
