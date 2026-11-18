import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posyandu_app/app/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class DashboardStatsShimmer extends StatelessWidget {
  const DashboardStatsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.border,
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _placeholder(46, 46, radius: 14),
                const Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _placeholder(110, 12),
                      const Gap(8),
                      _placeholder(75, 25),
                      const Gap(5),
                      _placeholder(130, 10),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(24),
            _placeholder(150, 12),
            const Gap(14),
            _placeholder(double.infinity, 13, radius: 20),
            const Gap(22),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 14,
                childAspectRatio: 3.8,
              ),
              itemBuilder: (_, _) {
                return Row(
                  children: [
                    _placeholder(9, 9, radius: 3),
                    const Gap(8),
                    Expanded(child: _placeholder(75, 10)),
                    const Gap(8),
                    _placeholder(22, 12),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder(double width, double height, {double radius = 6}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
