import 'package:flutter/material.dart';

import 'package:posyandu_app/shared/widgets/dashboard/dashboard_info_card.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_section_title.dart';

import '../models/kader_dashboard_model.dart';

class KaderPosyanduSection extends StatelessWidget {
  final KaderDashboardModel data;

  const KaderPosyanduSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final posyandu = data.posyandu;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardSectionTitle(
          title: 'Posyandu Saya',
          subtitle: 'Wilayah pelayanan yang ditugaskan',
        ),
        const SizedBox(height: 14),
        if (posyandu.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant
                    .withValues(alpha: 0.5),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.location_off_rounded,
                  size: 36,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Belum ada Posyandu',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  'Belum ada Posyandu yang ditugaskan kepada Anda.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          )
        else
          ...posyandu.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: DashboardInfoCard(nama: item.nama),
            ),
          ),
      ],
    );
  }
}
