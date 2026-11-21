import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/routes/app_routes.dart';
import 'package:posyandu_app/core/storage/token_storage.dart';
import 'package:posyandu_app/modules/auth/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final isLoading = false.obs;
  final isOtpStep = false.obs;

  final developmentOtp = RxnString();
  final errorMessage = ''.obs;

  String get phone => phoneController.text.trim();

  Future<void> requestOtp() async {
    if (phone.isEmpty) {
      errorMessage.value = 'Nomor HP wajib diisi.';
      return;
    }

    errorMessage.value = '';
    isLoading.value = true;

    try {
      final result = await _authService.requestOtp(phone);

      developmentOtp.value = result['otp']?.toString();
      otpController.clear();
      isOtpStep.value = true;

      Get.snackbar(
        'OTP Terkirim',
        result['message'] ?? 'Silakan masukkan kode OTP.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      errorMessage.value = _cleanError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp() async {
    final otp = otpController.text.trim();

    if (otp.length != 6) {
      errorMessage.value = 'Masukkan 6 digit kode OTP.';
      return;
    }

    errorMessage.value = '';
    isLoading.value = true;

    try {
      final result = await _authService.verifyOtp(phone: phone, otp: otp);

      final token = result['token']?.toString();

      if (token == null || token.isEmpty) {
        throw Exception('Token autentikasi tidak ditemukan.');
      }

      final user = Map<String, dynamic>.from(result['user']);

      final roles = List<String>.from(user['roles'] ?? []);

      if (roles.isEmpty) {
        throw Exception('Akun belum memiliki role aktif.');
      }

      // Simpan token setelah data user berhasil divalidasi.
      await TokenStorage.saveToken(token);

      if (roles.length > 1) {
        Get.offAllNamed(AppRoutes.selectRole, arguments: user);
        return;
      }

      final destination = _getDestination(roles.first);

      Get.offAllNamed(destination, arguments: user);
    } catch (e) {
      errorMessage.value = _cleanError(e);
    } finally {
      isLoading.value = false;
    }
  }

  String _getDestination(String role) {
    switch (role) {
      case 'admin_puskesmas':
        return AppRoutes.dashboardPuskesmas;

      case 'kader':
        return AppRoutes.dashboardKader;

      case 'admin_posyandu':
        return AppRoutes.dashboardPosyandu;

      default:
        throw Exception('Role pengguna tidak dikenali: $role');
    }
  }

  void backToPhone() {
    isOtpStep.value = false;
    developmentOtp.value = null;
    otpController.clear();
    errorMessage.value = '';
  }

  String _cleanError(Object error) {
    return error.toString().replaceFirst('Exception: ', '');
  }

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
