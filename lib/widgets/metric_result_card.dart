import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Kartu metrik hasil pengukuran (Tingkat pH, Kelembapan, Suhu Tanah)
/// dengan aksen bar kiri berwarna dan progress bar.
class MetricResultCard extends StatelessWidget {
  const MetricResultCard({
    super.key,
    required this.title,
    required this.value,
    required this.rangeLabel,
    required this.icon,
    required this.circleColor,
    required this.accentColor,
    required this.fill,
    this.iconColor = Colors.white,
  });

  final String title;
  final String value;
  final String rangeLabel;
  final IconData icon;
  final Color circleColor;
  final Color iconColor;

  /// Warna aksen bar kiri dan progress fill.
  final Color accentColor;

  /// Fraksi terisi pada progress bar (0.0 - 1.0).
  final double fill;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(14),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(width: 4, color: accentColor),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: circleColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon, size: 20, color: iconColor),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          rangeLabel,
                          style: TextStyle(
                            fontSize: 12.5,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Container(
                      height: 6,
                      color: AppColors.barTrack,
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: fill.clamp(0.0, 1.0),
                        child: Container(color: accentColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
