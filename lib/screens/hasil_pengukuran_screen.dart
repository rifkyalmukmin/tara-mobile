import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/metric_result_card.dart';
import '../widgets/soil_score_card.dart';

/// Layar "Hasil Pengukuran": skor kondisi tanah, metrik, dan rekomendasi.
class HasilPengukuranScreen extends StatelessWidget {
  const HasilPengukuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        const Text(
          'Hasil Pengukuran',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Wadah Tanam A1 - Tomat Ceri',
          style: TextStyle(fontSize: 13.5, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        const Text(
          '12 Oktober 2023, 08.30 WIB',
          style: TextStyle(fontSize: 12.5, color: AppColors.textTertiary),
        ),
        const SizedBox(height: 16),
        const SoilScoreCard(
          score: 85,
          label: 'Optimal',
          caption:
              'Kondisi tanah sangat baik untuk fase vegetatif tanaman tomat.',
        ),
        const SizedBox(height: 14),
        MetricResultCard(
          title: 'Tingkat pH',
          value: '6.5',
          rangeLabel: 'Ideal (6.0 - 7.0)',
          icon: Icons.science_outlined,
          circleColor: AppColors.brandGreen,
          accentColor: AppColors.darkGreen,
          fill: 0.52,
        ),
        const SizedBox(height: 14),
        MetricResultCard(
          title: 'Kelembapan',
          value: '72%',
          rangeLabel: 'Normal (60 - 80%)',
          icon: Icons.opacity,
          circleColor: AppColors.oliveDark,
          accentColor: AppColors.oliveDark,
          fill: 0.65,
        ),
        const SizedBox(height: 14),
        MetricResultCard(
          title: 'Suhu Tanah',
          value: '24°C',
          rangeLabel: 'Hangat (20 - 25°C)',
          icon: Icons.device_thermostat,
          circleColor: AppColors.peach,
          iconColor: AppColors.soilBrown,
          accentColor: AppColors.soilBrown,
          fill: 0.30,
        ),
        const SizedBox(height: 14),
        const _RekomendasiCard(),
        const SizedBox(height: 24),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.brandGreen,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.center_focus_weak, size: 17, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Pindai Ulang',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RekomendasiCard extends StatelessWidget {
  const _RekomendasiCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.recommendBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  color: AppColors.brandGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, size: 15, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text(
                'Rekomendasi TaniBot',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Lanjutkan jadwal penyiraman normal. Tambahkan sedikit mulsa '
            'untuk mempertahankan suhu di siang hari jika cuaca lebih panas.',
            style: TextStyle(
              fontSize: 12.5,
              height: 1.55,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
