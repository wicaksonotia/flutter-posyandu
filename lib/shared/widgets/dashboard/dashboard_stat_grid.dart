import 'package:flutter/material.dart';

import 'dashboard_stat_card.dart';

class DashboardStatGrid extends StatelessWidget {
  final List<DashboardStatCard> items;
  final int crossAxisCount;
  final double spacing;
  final double childAspectRatio;

  const DashboardStatGrid({
    super.key,
    required this.items,
    this.crossAxisCount = 2,
    this.spacing = 12,
    this.childAspectRatio = 1.18,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      childAspectRatio: childAspectRatio,
      children: items,
    );
  }
}
