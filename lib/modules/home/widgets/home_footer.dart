import 'package:flutter/material.dart';

import 'package:posyandu_app/app/theme/app_colors.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: const Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 8,
        children: [
          Text(
            '© Posyandu • Layanan Kesehatan Masyarakat',
            style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
          ),
          Text(
            'Melayani dengan sepenuh hati',
            style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
