import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Kartu CTA hijau "Mulai Pengukuran" pada beranda.
class MulaiPengukuranCard extends StatelessWidget {
  const MulaiPengukuranCard({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.brandGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const Icon(Icons.touch_app, size: 38, color: AppColors.onGreenIcon),
            const SizedBox(height: 10),
            const Text(
              'Mulai Pengukuran',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.onGreenTitle,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Tancapkan probe ke tanah\ndan tekan untuk memulai',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
                color: AppColors.onGreenSubtitle.withValues(alpha: 0.95),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
