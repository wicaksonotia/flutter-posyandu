import 'package:get/get.dart';
import 'package:posyandu_app/app/routes/app_routes.dart';
import 'package:posyandu_app/modules/auth/bindings/auth_binding.dart';
import 'package:posyandu_app/modules/auth/bindings/session_binding.dart';
import 'package:posyandu_app/modules/auth/views/login_view.dart';
import 'package:posyandu_app/modules/auth/views/role_selection_view.dart';
import 'package:posyandu_app/modules/auth/views/session_view.dart';
import 'package:posyandu_app/modules/home/bindings/home_binding.dart';
import 'package:posyandu_app/modules/home/views/home_view.dart';
import 'package:posyandu_app/modules/kader/bindings/kader_binding.dart';
import 'package:posyandu_app/modules/kader/views/kader_dashboard_view.dart';
import 'package:posyandu_app/modules/profile/bindings/profile_binding.dart';
import 'package:posyandu_app/modules/profile/views/profile_view.dart';
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
      name: AppRoutes.session,
      page: () => const SessionView(),
      binding: SessionBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(name: AppRoutes.selectRole, page: () => const RoleSelectionView()),
    // KADER
    GetPage(
      name: AppRoutes.dashboardKader,
      page: () => const KaderDashboardView(),
      binding: KaderBinding(),
    ),
    // PUSKEASMAS
    GetPage(
      name: AppRoutes.dashboardPuskesmas,
      page: () => const PuskesmasDashboardView(),
      binding: PuskesmasBinding(),
    ),
  ];
}
