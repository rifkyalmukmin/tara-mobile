import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum MeasurementStatus { optimal, needsWater }

/// Satu metrik ringkas pada kartu pengukuran, mis. "65% Hum".
class MeasurementMetric {
  const MeasurementMetric({
    required this.icon,
    required this.label,
    this.highlight = false,
  });

  final IconData icon;
  final String label;

  /// true = metrik di luar batas normal (ditampilkan berwarna amber).
  final bool highlight;
}

/// Kartu "Wadah Tanam" pada daftar pengukuran terakhir.
class MeasurementCard extends StatelessWidget {
  const MeasurementCard({
    super.key,
    required this.title,
    required this.timeLabel,
    required this.metrics,
    required this.status,
    this.onTap,
  });

  final String title;
  final String timeLabel;
  final List<MeasurementMetric> metrics;
  final MeasurementStatus status;
  final VoidCallback? onTap;

  Color get _statusColor => switch (status) {
    MeasurementStatus.optimal => AppColors.brandGreen,
    MeasurementStatus.needsWater => AppColors.amberText,
  };

  Color get _topBarColor => switch (status) {
    MeasurementStatus.optimal => AppColors.statusGreen,
    MeasurementStatus.needsWater => AppColors.amber,
  };

  String get _statusLabel => switch (status) {
    MeasurementStatus.optimal => 'Kondisi Optimal',
    MeasurementStatus.needsWater => 'Perlu Penyiraman',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 5, color: _topBarColor),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        timeLabel,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      for (var i = 0; i < metrics.length; i++) ...[
                        if (i > 0) const SizedBox(width: 8),
                        _MetricChip(metric: metrics[i]),
                      ],
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Divider(height: 1, color: AppColors.divider),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        _statusLabel,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: _statusColor,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: AppColors.textPrimary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({required this.metric});

  final MeasurementMetric metric;

  Color get _foreground =>
      metric.highlight ? AppColors.amberText : AppColors.textSecondary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.chipBg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(metric.icon, size: 14, color: _foreground),
          const SizedBox(width: 5),
          Text(
            metric.label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: _foreground,
            ),
          ),
        ],
      ),
    );
  }
}
