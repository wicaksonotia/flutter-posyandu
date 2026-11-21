import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:posyandu_app/app/routes/app_routes.dart';
import 'package:posyandu_app/core/storage/token_storage.dart';
import 'package:posyandu_app/modules/auth/services/auth_service.dart';

class SessionController extends GetxController {
  final AuthService _authService = AuthService();

  final isChecking = true.obs;
  final errorMessage = ''.obs;

  @override
  void onReady() {
    super.onReady();
    restoreSession();
  }

  Future<void> restoreSession() async {
    if (isChecking.value == false) {
      isChecking.value = true;
    }

    errorMessage.value = '';

    try {
      final hasToken = await TokenStorage.hasToken();

      if (!hasToken) {
        Get.offAllNamed(AppRoutes.login);
        return;
      }

      final user = await _authService.me();
      final roles = List<String>.from(user['roles'] ?? []);

      if (roles.isEmpty) {
        await TokenStorage.deleteToken();
        Get.offAllNamed(AppRoutes.login);
        return;
      }

      if (roles.length > 1) {
        Get.offAllNamed(AppRoutes.selectRole, arguments: user);
        return;
      }

      Get.offAllNamed(_getDestination(roles.first), arguments: user);
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      if (statusCode == 401 || statusCode == 403) {
        await TokenStorage.deleteToken();
        Get.offAllNamed(AppRoutes.login);
      } else {
        errorMessage.value =
            'Tidak dapat menghubungi server. Periksa koneksi internet Anda.';
      }
    } catch (e) {
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isChecking.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (_) {
      // Logout lokal tetap dilakukan jika server tidak dapat diakses.
    } finally {
      await TokenStorage.deleteToken();
      Get.offAllNamed(AppRoutes.login);
    }
  }

  String _getDestination(String role) {
    switch (role) {
      case 'admin_puskesmas':
        return AppRoutes.dashboardPuskesmas;
      case 'admin_posyandu':
        return AppRoutes.dashboardPosyandu;
      case 'kader':
        return AppRoutes.dashboardKader;
      default:
        throw Exception('Role tidak dikenali: $role');
    }
  }
}
