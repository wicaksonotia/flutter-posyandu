import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:posyandu_app/app/theme/app_colors.dart';

import 'chart_container.dart';

class VisitTrendChart extends StatefulWidget {
  const VisitTrendChart({super.key});

  @override
  State<VisitTrendChart> createState() => _VisitTrendChartState();
}

class _VisitTrendChartState extends State<VisitTrendChart> {
  int selectedPeriod = 6;

  final List<double> monthlyValues = const [
    145,
    185,
    220,
    195,
    270,
    245,
    328,
    290,
    310,
    275,
    350,
    380,
  ];

  static const monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];

  List<double> get displayedValues =>
      monthlyValues.sublist(12 - selectedPeriod);

  List<String> get displayedMonths {
    final now = DateTime.now();

    return List.generate(selectedPeriod, (index) {
      final date = DateTime(now.year, now.month - selectedPeriod + index + 1);

      return monthNames[date.month - 1];
    });
  }

  double get maxY {
    final highest = displayedValues.reduce((a, b) => a > b ? a : b);
    return ((highest / 100).ceil() * 100).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return ChartContainer(
      title: 'Tren Kunjungan',
      subtitle: 'Jumlah kunjungan Posyandu',
      trailing: _periodSelector(),
      child: SizedBox(
        height: 230,
        child: BarChart(
          BarChartData(
            maxY: maxY,
            minY: 0,
            alignment: BarChartAlignment.spaceAround,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${rod.toY.toInt()} kunjungan',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  );
                },
              ),
            ),
            gridData: FlGridData(
              drawVerticalLine: false,
              horizontalInterval: 100,
              getDrawingHorizontalLine: (value) =>
                  FlLine(color: AppColors.border, strokeWidth: 1),
            ),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 35,
                  interval: 100,
                  getTitlesWidget: (value, meta) => Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();

                    if (index < 0 || index >= displayedMonths.length) {
                      return const SizedBox.shrink();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        displayedMonths[index],
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            barGroups: List.generate(
              displayedValues.length,
              (index) => BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: displayedValues[index],
                    width: selectedPeriod == 3 ? 30 : 18,
                    color: index == displayedValues.length - 1
                        ? AppColors.primary
                        : AppColors.chartBar,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _periodSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: AppColors.chartBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: selectedPeriod,
          isDense: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: AppColors.primary,
          ),
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
          items: const [
            DropdownMenuItem(value: 3, child: Text('3 Bulan')),
            DropdownMenuItem(value: 6, child: Text('6 Bulan')),
            DropdownMenuItem(value: 12, child: Text('12 Bulan')),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() => selectedPeriod = value);
            }
          },
        ),
      ),
    );
  }
}
