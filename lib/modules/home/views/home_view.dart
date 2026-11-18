import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:posyandu_app/modules/home/controllers/home_controller.dart';
import 'package:posyandu_app/modules/home/widgets/home_charts.dart';
import 'package:posyandu_app/modules/home/widgets/home_footer.dart';
import 'package:posyandu_app/modules/home/widgets/home_header.dart';
import 'package:posyandu_app/modules/home/widgets/home_intro.dart';
import 'package:posyandu_app/modules/home/widgets/home_section_heading.dart';
import 'package:posyandu_app/modules/home/widgets/home_statistics.dart';
import 'package:posyandu_app/modules/home/widgets/resident_search.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 18 : 32,
                  vertical: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(onLogin: controller.goToLogin),
                    Gap(isMobile ? 24 : 32),

                    const HomeIntro(),
                    const Gap(24),

                    ResidentSearch(
                      controller: controller.searchController,
                      onSearch: controller.searchResident,
                    ),
                    const Gap(32),

                    const HomeSectionHeading(
                      title: 'Ringkasan Posyandu',
                      subtitle: 'Gambaran umum layanan Posyandu',
                    ),
                    const Gap(16),
                    const HomeStatistics(),
                    const Gap(32),

                    const HomeSectionHeading(
                      title: 'Statistik Layanan',
                      subtitle: 'Perkembangan kunjungan dan komposisi warga',
                    ),
                    const Gap(16),
                    const HomeCharts(),
                    const Gap(32),

                    const HomeFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
