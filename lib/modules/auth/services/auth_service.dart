import 'package:dio/dio.dart';
import 'package:posyandu_app/core/network/api_client.dart';

class AuthService {
  final Dio _dio = ApiClient.instance.dio;

  /// Mengambil data pengguna yang sedang login.

  Future<Map<String, dynamic>> me() async {
    final response = await _dio.get('/me');
    final result = Map<String, dynamic>.from(response.data);

    if (result['success'] != true || result['data'] is! Map) {
      throw Exception(result['message'] ?? 'Gagal mengambil data pengguna.');
    }

    return Map<String, dynamic>.from(result['data']);
  }

  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout');
    } on DioException catch (e) {
      // Token lokal tetap harus dihapus oleh controller.
      // Error selain 401 tetap diteruskan.
      if (e.response?.statusCode != 401) {
        throw Exception(_extractErrorMessage(e));
      }
    }
  }

  /// Meminta OTP ke backend.
  Future<Map<String, dynamic>> requestOtp(String phone) async {
    try {
      final response = await _dio.post(
        '/auth/request-otp',
        data: {'phone': phone},
      );

      final data = Map<String, dynamic>.from(response.data);

      if (data['success'] != true) {
        throw Exception(data['message'] ?? 'Gagal meminta kode OTP.');
      }

      return data;
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  /// Memverifikasi OTP dan mendapatkan token.
  Future<Map<String, dynamic>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/verify-otp',
        data: {'phone': phone, 'otp': otp},
      );

      final data = Map<String, dynamic>.from(response.data);

      if (data['success'] != true) {
        throw Exception(data['message'] ?? 'Verifikasi OTP gagal.');
      }

      return data;
    } on DioException catch (e) {
      throw Exception(_extractErrorMessage(e));
    }
  }

  String _extractErrorMessage(DioException e) {
    final responseData = e.response?.data;

    if (responseData is Map) {
      final errors = responseData['errors'];

      if (errors is Map) {
        for (final value in errors.values) {
          if (value is List && value.isNotEmpty) {
            return value.first.toString();
          }
        }
      }

      if (responseData['message'] != null) {
        return responseData['message'].toString();
      }
    }

    return e.message ?? 'Tidak dapat terhubung ke server.';
  }
}
