import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:posyandu_app/app/theme/app_colors.dart';

class ResidentSearch extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const ResidentSearch({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pencarian Data Warga',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF263E55),
            ),
          ),
          const Gap(5),
          const Text(
            'Masukkan nama atau NIK untuk mencari data warga.',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const Gap(17),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 480;

              final searchField = TextField(
                controller: controller,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => onSearch(),
                decoration: InputDecoration(
                  hintText: 'Nama lengkap atau NIK warga',
                  hintStyle: const TextStyle(fontSize: 13),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: AppColors.textSecondary,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                ),
              );

              final searchButton = SizedBox(
                height: 52,
                child: FilledButton(
                  onPressed: onSearch,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search_rounded, size: 18),
                      Gap(8),
                      Text('Cari Warga'),
                    ],
                  ),
                ),
              );

              if (isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [searchField, const Gap(10), searchButton],
                );
              }

              return Row(
                children: [
                  Expanded(child: searchField),
                  const Gap(12),
                  searchButton,
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
