import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFF1769B0), Color(0xFF2789CF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.health_and_safety_rounded,
              size: isMobile ? 120 : 190,
              color: Colors.white.withValues(alpha: 0.10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'LAYANAN KESEHATAN MASYARAKAT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Gap(18),
              Text(
                'Informasi dan Layanan\nPosyandu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 26 : 34,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const Gap(12),
              const SizedBox(
                width: 480,
                child: Text(
                  'Pantau informasi kegiatan dan akses layanan '
                  'Posyandu dengan lebih mudah, cepat, dan terpadu.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
