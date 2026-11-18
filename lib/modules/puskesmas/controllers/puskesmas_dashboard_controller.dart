import 'package:get/get.dart';

import '../models/puskesmas_dashboard_model.dart';
import '../services/puskesmas_dashboard_service.dart';

class PuskesmasDashboardController extends GetxController {
  final PuskesmasDashboardService _service = PuskesmasDashboardService();

  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  final Rxn<PuskesmasDashboardModel> dashboard = Rxn<PuskesmasDashboardModel>();

  @override
  void onInit() {
    super.onInit();
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      dashboard.value = await _service.getDashboard();
    } catch (e) {
      errorMessage.value = _parseError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshDashboard() async {
    await loadDashboard();
  }

  String _parseError(dynamic error) {
    return error.toString().replaceFirst('Exception: ', '');
  }
}
