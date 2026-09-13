import 'package:flutter/material.dart';

/// Warna yang diekstrak dari desain Figma "Beranda TaniBot" (node 1-5).
abstract final class AppColors {
  /// Hijau brand — CTA "Mulai Pengukuran" dan pill navigasi aktif.
  static const Color brandGreen = Color(0xFF1D5C40);

  /// Hijau sangat gelap untuk teks/ikon utama ("Tara", lonceng, ikon probe).
  static const Color darkGreen = Color(0xFF054227);

  /// Hijau terang untuk garis status kartu dan titik "Terhubung".
  static const Color statusGreen = Color(0xFF249F44);

  /// Amber untuk kartu yang perlu penyiraman.
  static const Color amber = Color(0xFFFBB402);

  /// Teks status "Perlu Penyiraman".
  static const Color amberText = Color(0xFFE8960A);

  /// Latar scaffold dan header.
  static const Color scaffoldBg = Color(0xFFF4F6F7);
  static const Color headerBg = Color(0xFFF7F8F9);

  static const Color cardBg = Colors.white;
  static const Color chipBg = Color(0xFFEAEBEC);
  static const Color badgeBg = Color(0xFFD0DDD8);

  static const Color textPrimary = Color(0xFF1C1E21);
  static const Color textSecondary = Color(0xFF6F7679);
  static const Color textTertiary = Color(0xFF9AA0A3);

  static const Color divider = Color(0xFFECEEEF);

  /// Track progress bar hasil pengukuran.
  static const Color barTrack = Color(0xFFDCE0E0);

  /// Olive gelap — aksen metrik Kelembapan.
  static const Color oliveDark = Color(0xFF49541A);

  /// Cokelat tanah — aksen metrik Suhu Tanah.
  static const Color soilBrown = Color(0xFF74462C);

  /// Peach — lingkaran ikon metrik Suhu Tanah.
  static const Color peach = Color(0xFFF7C8A6);

  /// Latar kartu rekomendasi.
  static const Color recommendBg = Color(0xFFF0F1F2);

  /// Merah hasil klasifikasi penyakit.
  static const Color diseaseRed = Color(0xFFB81414);

  /// Latar kartu saran penanganan (hijau muda).
  static const Color treatmentBg = Color(0xFFE6F4EC);

  /// Latar area unggah foto dan warna border putus-putusnya.
  static const Color uploadBg = Color(0xFFFAFBFA);
  static const Color dashedBorder = Color(0xFFB9C4BE);

  /// Teks dan ikon di atas kartu CTA hijau.
  static const Color onGreenTitle = Color(0xFFE8F3EB);
  static const Color onGreenSubtitle = Color(0xFF9DC3AA);
  static const Color onGreenIcon = Color(0xFFA5DDB8);
}
