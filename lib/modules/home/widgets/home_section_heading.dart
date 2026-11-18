import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posyandu_app/app/theme/app_colors.dart';

class HomeSectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const HomeSectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const Gap(5),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
