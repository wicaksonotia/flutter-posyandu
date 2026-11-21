import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/modules/auth/controllers/session_controller.dart';

class SessionView extends GetView<SessionController> {
  const SessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      body: SafeArea(
        child: Obx(() {
          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.cloud_off_rounded,
                      size: 52,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Tidak dapat terhubung',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.errorMessage.value,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: controller.restoreSession,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _SessionSkeleton(),
                SizedBox(height: 20),
                Text(
                  'Memeriksa sesi...',
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _SessionSkeleton extends StatelessWidget {
  const _SessionSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Icon(
        Icons.health_and_safety_rounded,
        size: 72,
        color: Color(0xFF1976D2),
      ),
    );
  }
}
