import 'package:posyandu_app/core/network/api_client.dart';

import '../models/puskesmas_dashboard_model.dart';

class PuskesmasDashboardService {
  final _dio = ApiClient.instance.dio;

  Future<PuskesmasDashboardModel> getDashboard() async {
    final response = await _dio.get('/puskesmas/dashboard');

    final responseData = response.data;

    if (responseData['success'] != true) {
      throw Exception(
        responseData['message'] ?? 'Gagal mengambil data dashboard.',
      );
    }

    return PuskesmasDashboardModel.fromJson(responseData['data']);
  }
}
