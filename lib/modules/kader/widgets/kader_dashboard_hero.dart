import 'package:flutter/material.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_header.dart';

class KaderDashboardHero extends StatelessWidget {
  const KaderDashboardHero({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardHeader(
      title: 'Dashboard Kader',
      subtitle: 'Pantau aktivitas pelayanan Posyandu Anda',
      badge: 'Kader Posyandu',
      icon: Icons.health_and_safety_rounded,
    );
  }
}
