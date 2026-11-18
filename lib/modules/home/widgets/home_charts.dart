import 'package:flutter/material.dart';

import 'resident_composition_chart.dart';
import 'visit_trend_chart.dart';

class HomeCharts extends StatelessWidget {
  const HomeCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 750;

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: const [
              Expanded(child: VisitTrendChart()),
              Expanded(child: ResidentCompositionChart()),
            ],
          );
        }

        return const Column(
          spacing: 16,
          children: [VisitTrendChart(), ResidentCompositionChart()],
        );
      },
    );
  }
}
