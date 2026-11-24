import 'package:flutter/material.dart';

class DashboardInfoCard extends StatelessWidget {
  final String nama;

  const DashboardInfoCard({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.15),
        ),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE8F5F3),
          child: Icon(
            Icons.health_and_safety_rounded,
            color: Color(0xFF26A69A),
          ),
        ),
        title: Text(
          nama,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        subtitle: const Text('Posyandu terdaftar'),
        trailing: const Icon(Icons.verified_rounded, color: Color(0xFF26A69A)),
      ),
    );
  }
}
