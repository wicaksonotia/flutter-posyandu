import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();

  final isLoading = false.obs;

  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  void searchResident() {
    final query = searchController.text.trim();

    if (query.isEmpty) {
      Get.snackbar(
        'Pencarian warga',
        'Masukkan nama atau NIK warga terlebih dahulu.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Integrasi pencarian akan ditambahkan setelah endpoint
    // pencarian warga publik tersedia di backend.
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
