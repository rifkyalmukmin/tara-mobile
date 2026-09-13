import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/measurement_card.dart';
import '../widgets/mulai_pengukuran_card.dart';
import '../widgets/status_probe_card.dart';

/// Konten layar "Beranda TaniBot" (ditanam di dalam HomeShell).
class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      children: [
        const StatusProbeCard(probeId: 'TB-8829', batteryPercent: 84),
        const SizedBox(height: 16),
        MulaiPengukuranCard(
          onTap: () {
            // TODO: arahkan ke alur pengukuran.
          },
        ),
        const SizedBox(height: 24),
        const Text(
          'Daftar Pengukuran Terakhir',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 14),
        MeasurementCard(
          title: 'Wadah Tanam A1',
          timeLabel: '10 Menit lalu',
          status: MeasurementStatus.optimal,
          metrics: const [
            MeasurementMetric(icon: Icons.opacity, label: '65% Hum'),
            MeasurementMetric(icon: Icons.device_thermostat, label: '28°C'),
            MeasurementMetric(icon: Icons.science_outlined, label: 'pH 6.8'),
          ],
        ),
        const SizedBox(height: 16),
        MeasurementCard(
          title: 'Wadah Tanam B3',
          timeLabel: '2 Jam lalu',
          status: MeasurementStatus.needsWater,
          metrics: const [
            MeasurementMetric(
              icon: Icons.opacity,
              label: '30% Hum',
              highlight: true,
            ),
            MeasurementMetric(icon: Icons.device_thermostat, label: '31°C'),
            MeasurementMetric(icon: Icons.science_outlined, label: 'pH 6.5'),
          ],
        ),
        const SizedBox(height: 16),
        MeasurementCard(
          title: 'Wadah Tanam A2',
          timeLabel: 'Kemarin',
          status: MeasurementStatus.optimal,
          metrics: const [
            MeasurementMetric(icon: Icons.opacity, label: '62% Hum'),
            MeasurementMetric(icon: Icons.device_thermostat, label: '27°C'),
            MeasurementMetric(icon: Icons.science_outlined, label: 'pH 7.0'),
          ],
        ),
      ],
    );
  }
}
