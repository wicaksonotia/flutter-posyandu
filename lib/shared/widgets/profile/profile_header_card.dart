import 'package:flutter/material.dart';
import 'package:posyandu_app/shared/widgets/dashboard/dashboard_hero_card.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final String role;

  const ProfileHeaderCard({super.key, required this.name, required this.role});

  String get initials {
    final words = name.trim().split(RegExp(r'\s+'));

    if (name.trim().isEmpty || words.first.isEmpty) return 'U';

    if (words.length == 1) {
      return words.first.substring(0, 1).toUpperCase();
    }

    return '${words.first[0]}${words[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardHeroCard(
      title: name,
      subtitle: role,
      icon: Icons.person_rounded,
      trailing: Container(
        width: 52,
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.17),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.35),
            width: 1.5,
          ),
        ),
        child: Text(
          initials,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
