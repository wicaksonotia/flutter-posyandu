import 'package:flutter/material.dart';

import 'dashboard_hero_card.dart';

class DashboardHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? badge;
  final IconData icon;
  final Widget? trailing;

  const DashboardHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.badge,
    this.icon = Icons.dashboard_rounded,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardHeroCard(
      title: title,
      subtitle: subtitle,
      badge: badge,
      icon: icon,
      trailing: trailing,
    );
  }
}
