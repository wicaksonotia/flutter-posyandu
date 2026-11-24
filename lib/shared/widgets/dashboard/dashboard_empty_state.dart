import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardEmptyState extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const DashboardEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.inbox_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        children: [
          Icon(
            icon,
            size: 46,
            color: colors.onSurfaceVariant.withValues(alpha: 0.6),
          ),
          const Gap(12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const Gap(6),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: colors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
