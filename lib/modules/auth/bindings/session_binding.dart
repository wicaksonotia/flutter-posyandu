import 'package:get/get.dart';
import 'package:posyandu_app/modules/auth/controllers/session_controller.dart';

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SessionController>(() => SessionController());
  }
}
