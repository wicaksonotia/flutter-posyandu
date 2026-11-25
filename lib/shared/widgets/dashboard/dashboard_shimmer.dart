import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  final int cardCount;

  const DashboardShimmer({super.key, this.cardCount = 4});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: colors.surfaceContainerHighest,
      highlightColor: colors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroShimmer(),
          const Gap(26),

          // Statistik
          GridView.builder(
            itemCount: cardCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.35,
            ),
            itemBuilder: (context, index) {
              return _buildStatCard();
            },
          ),

          const Gap(26),

          // Judul section
          _placeholder(width: 150, height: 18),
          const Gap(14),

          // Card daftar Posyandu
          _buildPosyanduCard(),
          const Gap(12),
          _buildPosyanduCard(),
        ],
      ),
    );
  }

  Widget _buildHeroShimmer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _placeholder(width: 52, height: 52, radius: 17),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _placeholder(width: 145, height: 20),
                const Gap(9),
                _placeholder(width: 180, height: 12),
              ],
            ),
          ),
          _placeholder(width: 42, height: 42, radius: 50),
        ],
      ),
    );
  }

  Widget _buildStatCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _placeholder(width: 38, height: 38, radius: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _placeholder(width: 65, height: 20),
              const Gap(7),
              _placeholder(width: 95, height: 11),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPosyanduCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          _placeholder(width: 46, height: 46, radius: 14),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _placeholder(width: 135, height: 15),
                const Gap(8),
                _placeholder(width: 190, height: 11),
              ],
            ),
          ),
          _placeholder(width: 20, height: 20, radius: 8),
        ],
      ),
    );
  }

  Widget _placeholder({
    required double width,
    required double height,
    double radius = 8,
  }) {
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
