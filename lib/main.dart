import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/pages/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const PosyanduApp());
}

class PosyanduApp extends StatelessWidget {
  const PosyanduApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Posyandu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.dashboardPuskesmas,
      getPages: AppPages.pages,
    );
  }
}
