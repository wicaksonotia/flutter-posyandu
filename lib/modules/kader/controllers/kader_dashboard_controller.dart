import 'package:get/get.dart';
import 'package:posyandu_app/modules/kader/models/kader_dashboard_model.dart';
import 'package:posyandu_app/modules/kader/services/kader_dashboard_service.dart';

class KaderDashboardController extends GetxController {
  final KaderDashboardService _service = KaderDashboardService();

  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  final Rxn<KaderDashboardModel> dashboard = Rxn<KaderDashboardModel>();

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
