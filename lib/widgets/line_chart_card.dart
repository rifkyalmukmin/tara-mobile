import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Kartu grafik garis untuk layar Riwayat Pengukuran: judul + ikon,
/// badge opsional, dan grafik garis dengan grid, label sumbu, titik,
/// serta area fill opsional di bawah garis.
class LineChartCard extends StatelessWidget {
  const LineChartCard({
    super.key,
    required this.title,
    required this.titleIcon,
    required this.titleIconColor,
    required this.lineColor,
    required this.points,
    required this.yMin,
    required this.yMax,
    required this.yStep,
    required this.yLabelDecimals,
    required this.xLabels,
    this.badgeLabel,
    this.areaColor,
  });

  final String title;
  final IconData titleIcon;
  final Color titleIconColor;
  final Color lineColor;
  final List<double> points;
  final double yMin;
  final double yMax;
  final double yStep;
  final int yLabelDecimals;
  final List<String> xLabels;

  /// Badge kecil di kanan judul (mis. "7 Hari Terakhir").
  final String? badgeLabel;

  /// Warna area di bawah garis; null = tanpa area fill.
  final Color? areaColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              Icon(titleIcon, size: 16, color: titleIconColor),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              if (badgeLabel != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.brandGreen,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    badgeLabel!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 190,
            width: double.infinity,
            child: CustomPaint(
              painter: _LineChartPainter(
                points: points,
                yMin: yMin,
                yMax: yMax,
                yStep: yStep,
                yLabelDecimals: yLabelDecimals,
                xLabels: xLabels,
                lineColor: lineColor,
                areaColor: areaColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  const _LineChartPainter({
    required this.points,
    required this.yMin,
    required this.yMax,
    required this.yStep,
    required this.yLabelDecimals,
    required this.xLabels,
    required this.lineColor,
    required this.areaColor,
  });

  final List<double> points;
  final double yMin;
  final double yMax;
  final double yStep;
  final int yLabelDecimals;
  final List<String> xLabels;
  final Color lineColor;
  final Color? areaColor;

  static const _labelStyle = TextStyle(
    fontSize: 10,
    color: AppColors.textSecondary,
  );

  @override
  void paint(Canvas canvas, Size size) {
    const leftInset = 32.0;
    const bottomInset = 20.0;
    final plotTop = 4.0;
    final plotBottom = size.height - bottomInset;
    final plotLeft = leftInset;
    final plotRight = size.width - 4.0;

    final gridPaint = Paint()
      ..color = const Color(0xFFECEEEF)
      ..strokeWidth = 1;
    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Grid horizontal + label sumbu Y.
    final gridCount = ((yMax - yMin) / yStep).round();
    for (var i = 0; i <= gridCount; i++) {
      final value = yMin + i * yStep;
      final t = (value - yMin) / (yMax - yMin);
      final y = plotBottom - t * (plotBottom - plotTop);
      canvas.drawLine(Offset(plotLeft, y), Offset(plotRight, y), gridPaint);
      _drawLabel(
        canvas,
        value.toStringAsFixed(yLabelDecimals),
        Offset(plotLeft - 6, y),
        alignRight: true,
      );
    }

    // Plot area garis dan titik.
    Offset pointAt(int index) {
      final x = plotLeft +
          index * (plotRight - plotLeft) / (points.length - 1);
      final t = (points[index] - yMin) / (yMax - yMin);
      return Offset(x, plotBottom - t * (plotBottom - plotTop));
    }

    if (areaColor != null) {
      final areaPath = Path()
        ..moveTo(pointAt(0).dx, plotBottom);
      for (var i = 0; i < points.length; i++) {
        areaPath.lineTo(pointAt(i).dx, pointAt(i).dy);
      }
      areaPath
        ..lineTo(pointAt(points.length - 1).dx, plotBottom)
        ..close();
      canvas.drawPath(areaPath, Paint()..color = areaColor!);
    }

    final linePath = Path()..moveTo(pointAt(0).dx, pointAt(0).dy);
    for (var i = 1; i < points.length; i++) {
      linePath.lineTo(pointAt(i).dx, pointAt(i).dy);
    }
    canvas.drawPath(linePath, linePaint);

    final dotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final dotStroke = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    for (var i = 0; i < points.length; i++) {
      canvas.drawCircle(pointAt(i), 3.5, dotPaint);
      canvas.drawCircle(pointAt(i), 3.5, dotStroke);
    }

    // Label sumbu X.
    for (var i = 0; i < xLabels.length; i++) {
      final x = plotLeft + i * (plotRight - plotLeft) / (xLabels.length - 1);
      _drawLabel(canvas, xLabels[i], Offset(x, plotBottom + 6));
    }
  }

  void _drawLabel(
    Canvas canvas,
    String text,
    Offset anchor, {
    bool alignRight = false,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: _labelStyle),
      textDirection: TextDirection.ltr,
    )..layout();
    final dx = alignRight ? anchor.dx - painter.width : anchor.dx - painter.width / 2;
    painter.paint(canvas, Offset(dx, anchor.dy - painter.height / 2));
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter old) =>
      old.points != points || old.lineColor != lineColor;
}
