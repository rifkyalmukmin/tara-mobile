import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Layar "Deteksi Penyakit Daun": unggah foto, hasil klasifikasi AI,
/// dan saran penanganan berbasis LLM.
class DeteksiPenyakitScreen extends StatelessWidget {
  const DeteksiPenyakitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: const [
        Text(
          'Deteksi Penyakit Daun',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Unggah atau ambil foto daun tanaman Anda yang terindikasi '
          'sakit. AI TaniBot akan membantu menganalisis dan memberikan '
          'saran penanganan.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.5,
            height: 1.55,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 20),
        _UploadSection(),
        SizedBox(height: 20),
        _ClassificationCard(),
        SizedBox(height: 16),
        _TreatmentCard(),
      ],
    );
  }
}

class _UploadSection extends StatelessWidget {
  const _UploadSection();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _DashedRRectPainter(
        radius: 16,
        color: AppColors.dashedBorder,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.uploadBg,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: AppColors.brandGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_a_photo,
                size: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Ambil/Unggah Foto',
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pastikan daun terlihat jelas dan terang',
              style: TextStyle(
                fontSize: 12.5,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.brandGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download, size: 15, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    'Pilih Foto',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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

class _ClassificationCard extends StatelessWidget {
  const _ClassificationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 4, color: AppColors.diseaseRed),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.coronavirus, size: 18, color: AppColors.diseaseRed),
                    SizedBox(width: 8),
                    Text(
                      'Hasil Klasifikasi',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bercak Daun (Leaf Spot)',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: AppColors.diseaseRed,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Terdeteksi pada tanaman Tomat.',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Tingkat Keyakinan',
                  style: TextStyle(
                    fontSize: 11.5,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          height: 6,
                          color: AppColors.barTrack,
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.78,
                            child: Container(color: AppColors.darkGreen),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '88%',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TreatmentCard extends StatelessWidget {
  const _TreatmentCard();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 13,
      height: 1.6,
      color: AppColors.textSecondary,
    );
    const boldStyle = TextStyle(
      fontSize: 13,
      height: 1.6,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.eco, size: 16, color: AppColors.darkGreen),
              SizedBox(width: 8),
              Text(
                'Saran Penanganan berbasis LLM',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.treatmentBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.auto_awesome,
                    size: 14,
                    color: AppColors.darkGreen,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      style: bodyStyle,
                      children: const [
                        TextSpan(
                          text: 'Berdasarkan identifikasi bercak daun '
                              '(Cercospora), berikut langkah penanganannya:\n\n',
                        ),
                        TextSpan(
                          text: 'Isolasi: ',
                          style: boldStyle,
                        ),
                        TextSpan(
                          text: 'Pangkas dan buang daun yang terinfeksi '
                              'jauh dari area tanam untuk mencegah '
                              'penyebaran spora.\n\n',
                        ),
                        TextSpan(text: 'Sirkulasi Udara: ', style: boldStyle),
                        TextSpan(
                          text: 'Kurangi kelembapan dengan menjaga jarak '
                              'tanam. Pastikan sinar matahari cukup.\n\n',
                        ),
                        TextSpan(text: 'Perawatan: ', style: boldStyle),
                        TextSpan(
                          text: 'Gunakan fungisida berbahan aktif tembaga '
                              'atau mankozeb sesuai dosis anjuran.\n\n',
                        ),
                        TextSpan(text: 'Penyiraman: ', style: boldStyle),
                        TextSpan(
                          text: 'Hindari penyiraman dari atas daun; siram '
                              'langsung ke area perakaran (soil).',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.thumb_up_outlined,
                  size: 15,
                  color: AppColors.textSecondary,
                ),
                label: const Text(
                  'Berguna',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  size: 15,
                  color: AppColors.textSecondary,
                ),
                label: const Text(
                  'Bagikan',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.textSecondary,
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

/// Menggambar border rounded-rect putus-putus (dashed).
class _DashedRRectPainter extends CustomPainter {
  const _DashedRRectPainter({required this.radius, required this.color});

  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          Radius.circular(radius),
        ),
      );
    const dashWidth = 5.0;
    const dashGap = 4.0;
    for (final metric in path.computeMetrics()) {
      var dist = 0.0;
      while (dist < metric.length) {
        final next = dist + dashWidth;
        canvas.drawPath(metric.extractPath(dist, next), paint);
        dist = next + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRRectPainter old) =>
      old.color != color || old.radius != radius;
}
