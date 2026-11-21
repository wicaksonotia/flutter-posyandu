import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelectionView extends StatelessWidget {
  const RoleSelectionView({super.key});

  String _getRoleName(String role) {
    switch (role) {
      case 'admin_puskesmas':
        return 'Admin Puskesmas';
      case 'admin_posyandu':
        return 'Admin Posyandu';
      case 'kader':
        return 'Kader Posyandu';
      default:
        return role;
    }
  }

  String _getRoleDescription(String role) {
    switch (role) {
      case 'admin_puskesmas':
        return 'Kelola dan pantau seluruh Posyandu dalam wilayah kerja Puskesmas.';
      case 'admin_posyandu':
        return 'Kelola kegiatan dan pelayanan Posyandu.';
      case 'kader':
        return 'Kelola warga, kegiatan, dan pemeriksaan Posyandu.';
      default:
        return 'Akses layanan Posyandu.';
    }
  }

  IconData _getRoleIcon(String role) {
    switch (role) {
      case 'admin_puskesmas':
        return Icons.local_hospital_rounded;
      case 'admin_posyandu':
        return Icons.business_rounded;
      case 'kader':
        return Icons.people_alt_rounded;
      default:
        return Icons.person_rounded;
    }
  }

  String? _getDestination(String role) {
    switch (role) {
      case 'admin_puskesmas':
        return '/dashboard-puskesmas';
      case 'admin_posyandu':
        return '/dashboard-posyandu';
      case 'kader':
        return '/dashboard-kader';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final arguments = Get.arguments;

    final user = arguments is Map
        ? Map<String, dynamic>.from(arguments)
        : <String, dynamic>{};

    final roles = List<String>.from(user['roles'] ?? []);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pilih Peran'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'Halo, ${user['name'] ?? 'Pengguna'}',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Anda memiliki beberapa peran aktif. Silakan pilih peran yang ingin digunakan.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 28),

            ...roles.map((role) {
              final destination = _getDestination(role);

              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Card(
                  elevation: 0,
                  color: theme.colorScheme.surfaceContainerLow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: theme.colorScheme.outlineVariant),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: destination == null
                        ? null
                        : () {
                            Get.offAllNamed(destination, arguments: user);
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              _getRoleIcon(role),
                              color: theme.colorScheme.onPrimaryContainer,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getRoleName(role),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _getRoleDescription(role),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
