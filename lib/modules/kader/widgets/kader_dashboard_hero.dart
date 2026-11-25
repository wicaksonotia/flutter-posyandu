import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:posyandu_app/app/routes/app_routes.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_header.dart';

class KaderDashboardHero extends StatelessWidget {
  const KaderDashboardHero({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardHeader(
      title: 'Dashboard Kader',
      subtitle: 'Selamat datang di Posyandu',
      trailing: Material(
        color: Colors.white,
        shape: const CircleBorder(),
        elevation: 2,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => Get.toNamed(AppRoutes.profile),
          child: const SizedBox(
            width: 42,
            height: 42,
            child: Icon(
              Icons.person_outline_rounded,
              color: Color(0xFF1976D2),
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
