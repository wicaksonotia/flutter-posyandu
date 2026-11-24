import 'package:dio/dio.dart';
import 'package:posyandu_app/core/network/api_client.dart';
import 'package:posyandu_app/modules/kader/models/kader_dashboard_model.dart';

class KaderDashboardService {
  final Dio _dio = ApiClient.instance.dio;

  Future<KaderDashboardModel> getDashboard() async {
    try {
      final response = await _dio.get('/kader/dashboard');

      final responseData = Map<String, dynamic>.from(response.data);

      if (responseData['success'] != true) {
        throw Exception(responseData['message'] ?? 'Gagal memuat dashboard.');
      }

      final data = Map<String, dynamic>.from(responseData['data'] ?? {});

      return KaderDashboardModel.fromJson(data);
    } on DioException catch (e) {
      final responseData = e.response?.data;

      if (responseData is Map) {
        throw Exception(
          responseData['message'] ?? 'Gagal terhubung ke server.',
        );
      }

      throw Exception(e.message ?? 'Tidak dapat terhubung ke server.');
    }
  }
}
