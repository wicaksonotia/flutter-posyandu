import 'package:get/get.dart';
import 'package:posyandu_app/app/routes/app_routes.dart';
import 'package:posyandu_app/core/storage/token_storage.dart';
import 'package:posyandu_app/modules/auth/services/auth_service.dart';

class ProfileController extends GetxController {
  final AuthService _authService = AuthService();

  final profile = <String, dynamic>{}.obs;

  final isLoading = false.obs;
  final isLoggingOut = false.obs;
  final errorMessage = ''.obs;

  Map<String, dynamic> get user {
    final nestedUser = profile['user'];

    if (nestedUser is Map) {
      return Map<String, dynamic>.from(nestedUser);
    }

    return profile;
  }

  String get name {
    return _readValue(['name', 'nama', 'nama_lengkap'], fallback: 'Pengguna');
  }

  String get phone {
    return _readValue(['phone', 'no_hp', 'nomor_hp', 'telepon']);
  }

  String get email {
    return _readValue(['email']);
  }

  String get role {
    final directRole = _readValue(['role_name', 'nama_role', 'role']);

    if (directRole.isNotEmpty) return directRole;

    final roles = user['roles'];

    if (roles is List && roles.isNotEmpty) {
      final firstRole = roles.first;

      if (firstRole is Map) {
        return (firstRole['name'] ??
                firstRole['nama'] ??
                firstRole['display_name'] ??
                '')
            .toString();
      }

      return firstRole.toString();
    }

    return 'Pengguna';
  }

  String _readValue(List<String> keys, {String fallback = '-'}) {
    for (final key in keys) {
      final value = user[key];

      if (value != null && value.toString().trim().isNotEmpty) {
        return value.toString();
      }
    }

    return fallback;
  }

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    errorMessage.value = '';
    isLoading.value = true;

    try {
      final result = await _authService.me();
      profile.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    if (isLoggingOut.value) return;

    isLoggingOut.value = true;

    try {
      try {
        await _authService.logout();
      } catch (_) {
        // Logout lokal tetap dilakukan meskipun server gagal.
      }
    } finally {
      await TokenStorage.deleteToken();
      isLoggingOut.value = false;
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
