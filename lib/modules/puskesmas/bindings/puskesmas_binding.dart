import 'package:get/get.dart';

import '../controllers/puskesmas_dashboard_controller.dart';

class PuskesmasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PuskesmasDashboardController>(
      () => PuskesmasDashboardController(),
    );
  }
}
