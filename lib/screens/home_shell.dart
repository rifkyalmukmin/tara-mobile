import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/tara_bottom_nav.dart';
import 'beranda_screen.dart';
import 'chat_screen.dart';
import 'deteksi_penyakit_screen.dart';
import 'hasil_pengukuran_screen.dart';
import 'riwayat_screen.dart';

/// Shell utama aplikasi: header "Tara" bersama, konten per-tab
/// (IndexedStack agar state tiap tab tetap hidup), dan bottom navigation.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
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
              child: IndexedStack(
                index: _selectedIndex,
                children: const [
                  BerandaScreen(),
                  HasilPengukuranScreen(),
                  DeteksiPenyakitScreen(),
                  ChatScreen(),
                  RiwayatScreen(),
                ],
              ),
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
