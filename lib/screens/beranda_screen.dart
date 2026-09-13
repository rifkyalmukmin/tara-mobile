import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/measurement_card.dart';
import '../widgets/mulai_pengukuran_card.dart';
import '../widgets/status_probe_card.dart';
import '../widgets/tara_bottom_nav.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  int _selectedIndex = 0;

  static const _navItems = [
    TaraNavItem(icon: Icons.home_outlined, label: 'Beranda'),
    TaraNavItem(icon: Icons.insert_chart_outlined, label: 'Hasil'),
    TaraNavItem(icon: Icons.grass, label: 'Deteksi'),
    TaraNavItem(icon: Icons.chat_outlined, label: 'Chat'),
    TaraNavItem(icon: Icons.history, label: 'Riwayat'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _Header(),
            Expanded(
              child: _selectedIndex == 0 ? const _BerandaBody() : const _PlaceholderBody(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TaraBottomNav(
        items: _navItems,
        selectedIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.headerBg,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          // TODO: ganti dengan foto profil asli hasil ekspor dari Figma.
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.badgeBg,
            child: Icon(Icons.person, size: 24, color: AppColors.darkGreen),
          ),
          const SizedBox(width: 12),
          const Text(
            'Tara',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGreen,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              size: 26,
              color: AppColors.darkGreen,
            ),
          ),
        ],
      ),
    );
  }
}

class _BerandaBody extends StatelessWidget {
  const _BerandaBody();

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

/// Penampung sementara untuk tab yang belum diimplementasikan.
class _PlaceholderBody extends StatelessWidget {
  const _PlaceholderBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Segera hadir',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
