import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:posyandu_app/app/theme/app_colors.dart';

import 'chart_container.dart';

class ResidentCompositionChart extends StatelessWidget {
  const ResidentCompositionChart({super.key});

  static const List<_ResidentGroup> groups = [
    _ResidentGroup('Balita', 20, AppColors.statBalita),
    _ResidentGroup('Anak', 14, AppColors.statAnak),
    _ResidentGroup('Remaja', 18, AppColors.statRemaja),
    _ResidentGroup('Dewasa', 32, AppColors.statDewasa),
    _ResidentGroup('Lansia', 16, AppColors.statLansia),
  ];

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Komposisi Warga',
      subtitle: 'Distribusi berdasarkan kelompok usia',
      child: SizedBox(
        height: 230,
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: PieChart(
                PieChartData(
                  sections: groups.map((group) {
                    return PieChartSectionData(
                      value: group.value.toDouble(),
                      color: group.color,
                      title: '${group.value}%',
                      radius: 30,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList(),
                  centerSpaceRadius: 38,
                  sectionsSpace: 3,
                  pieTouchData: PieTouchData(enabled: true),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LegendItem(group: groups[0]),
                  Gap(12),
                  _LegendItem(group: groups[1]),
                  Gap(12),
                  _LegendItem(group: groups[2]),
                  Gap(12),
                  _LegendItem(group: groups[3]),
                  Gap(12),
                  _LegendItem(group: groups[4]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResidentGroup {
  final String title;
  final int value;
  final Color color;

  const _ResidentGroup(this.title, this.value, this.color);
}

class _LegendItem extends StatelessWidget {
  final _ResidentGroup group;

  const _LegendItem({required this.group});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(color: group.color, shape: BoxShape.circle),
        ),
        const Gap(8),
        Expanded(
          child: Text(
            group.title,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          '${group.value}%',
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
