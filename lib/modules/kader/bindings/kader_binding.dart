import 'package:get/get.dart';
import 'package:posyandu_app/modules/kader/controllers/kader_dashboard_controller.dart';

class KaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KaderDashboardController>(() => KaderDashboardController());
  }
}
