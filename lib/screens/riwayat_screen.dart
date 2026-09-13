import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/line_chart_card.dart';

/// Layar "Riwayat Pengukuran": grafik riwayat kondisi tanah 7 hari
/// terakhir dan log pengukuran.
class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  static const _xLabels = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        const Text(
          'Tracking Kondisi Tanah',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Pantau riwayat kondisi tanah untuk mengoptimalkan pertumbuhan.',
          style: TextStyle(
            fontSize: 13,
            height: 1.5,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 14),
        // TODO: hubungkan dengan daftar wadah tanam asli.
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  'Wadah Tanam A1 (Tomat)',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_double_arrow_down,
                size: 20,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        LineChartCard(
          title: 'Kelembaban Tanah (%)',
          titleIcon: Icons.opacity,
          titleIconColor: AppColors.brandGreen,
          lineColor: const Color(0xFF0B4A32),
          areaColor: const Color(0xFFE9EFEC),
          points: const [65, 62, 58, 42, 60, 64, 65],
          yMin: 20,
          yMax: 100,
          yStep: 10,
          yLabelDecimals: 0,
          xLabels: _xLabels,
          badgeLabel: '7 Hari Terakhir',
        ),
        const SizedBox(height: 16),
        LineChartCard(
          title: 'Tingkat pH',
          titleIcon: Icons.science_outlined,
          titleIconColor: AppColors.soilBrown,
          lineColor: AppColors.soilBrown,
          points: const [6.5, 6.6, 6.45, 6.7, 6.8, 6.8, 6.8],
          yMin: 5.0,
          yMax: 8.0,
          yStep: 0.5,
          yLabelDecimals: 1,
          xLabels: _xLabels,
        ),
        const SizedBox(height: 16),
        LineChartCard(
          title: 'Suhu Lingkungan (°C)',
          titleIcon: Icons.device_thermostat,
          titleIconColor: AppColors.oliveDark,
          lineColor: AppColors.oliveDark,
          points: const [25, 26, 28, 30.5, 29, 26, 26.5],
          yMin: 20,
          yMax: 40,
          yStep: 4,
          yLabelDecimals: 0,
          xLabels: _xLabels,
        ),
        const SizedBox(height: 24),
        const Text(
          'Log Pengukuran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 14),
        const _LogCard(
          status: _LogStatus.optimal,
          title: 'Wadah Tanam A1',
          timeLabel: 'Hari ini, 08:00 WIB',
          humidity: '65%',
          ph: '6.8',
          temperature: '26°C',
        ),
        const SizedBox(height: 12),
        const _LogCard(
          status: _LogStatus.dry,
          title: 'Wadah Tanam A1',
          timeLabel: 'Kemarin, 17:30 WIB',
          humidity: '42%',
          ph: '6.7',
          temperature: '30°C',
        ),
        const SizedBox(height: 12),
        const _LogCard(
          status: _LogStatus.optimal,
          title: 'Wadah Tanam A1',
          timeLabel: 'Kemarin, 08:15 WIB',
          humidity: '62%',
          ph: '6.8',
          temperature: '25°C',
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.brandGreen, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Muat Lebih Banyak',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.brandGreen,
            ),
          ),
        ),
      ],
    );
  }
}

enum _LogStatus { optimal, dry }

class _LogCard extends StatelessWidget {
  const _LogCard({
    required this.status,
    required this.title,
    required this.timeLabel,
    required this.humidity,
    required this.ph,
    required this.temperature,
  });

  final _LogStatus status;
  final String title;
  final String timeLabel;
  final String humidity;
  final String ph;
  final String temperature;

  bool get _isWarning => status == _LogStatus.dry;

  Color get _statusColor =>
      _isWarning ? AppColors.diseaseRed : AppColors.brandGreen;

  Color get _statusBg => _isWarning
      ? const Color(0xFFFBE7E4)
      : const Color(0xFFE1F0E6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: _statusBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _isWarning ? Icons.warning_amber_rounded : Icons.wifi_tethering,
                  size: 18,
                  color: _statusColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timeLabel,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _LogChip(
                icon: Icons.opacity,
                label: humidity,
                highlight: _isWarning,
              ),
              const SizedBox(width: 6),
              _LogChip(icon: Icons.science_outlined, label: ph),
              const SizedBox(width: 6),
              _LogChip(icon: Icons.device_thermostat, label: temperature),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _statusBg,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  _isWarning ? 'Kering' : 'Optimal',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: _statusColor,
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

class _LogChip extends StatelessWidget {
  const _LogChip({
    required this.icon,
    required this.label,
    this.highlight = false,
  });

  final IconData icon;
  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final foreground = highlight ? AppColors.diseaseRed : AppColors.textSecondary;
    final background =
        highlight ? const Color(0xFFFBE7E4) : const Color(0xFFF1F2F3);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: foreground),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: foreground,
            ),
          ),
        ],
      ),
    );
  }
}
