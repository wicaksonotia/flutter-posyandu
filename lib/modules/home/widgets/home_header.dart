import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:posyandu_app/app/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback onLogin;

  const HomeHeader({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF2FC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.health_and_safety_outlined,
            color: AppColors.primary,
            size: 27,
          ),
        ),
        const Gap(12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'POSYANDU',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                  color: Color(0xFF174B7A),
                ),
              ),
              Gap(2),
              Text(
                'Layanan Kesehatan Masyarakat',
                style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        OutlinedButton.icon(
          onPressed: onLogin,
          icon: const Icon(Icons.login_rounded, size: 17),
          label: Text(isMobile ? 'Login' : 'Login Admin / Kader'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 1),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 18,
              vertical: 13,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
      ],
    );
  }
}
