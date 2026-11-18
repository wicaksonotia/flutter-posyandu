import 'package:get/get.dart';
import 'package:posyandu_app/app/routes/app_routes.dart';
import 'package:posyandu_app/modules/auth/views/login_view.dart';
import 'package:posyandu_app/modules/home/bindings/home_binding.dart';
import 'package:posyandu_app/modules/home/views/home_view.dart';
import 'package:posyandu_app/modules/puskesmas/bindings/puskesmas_binding.dart';
import 'package:posyandu_app/modules/puskesmas/views/puskesmas_dashboard_view.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboardPuskesmas,
      page: () => const PuskesmasDashboardView(),
      binding: PuskesmasBinding(),
    ),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
  ];
}
