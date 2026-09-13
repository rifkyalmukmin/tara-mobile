import 'package:flutter_test/flutter_test.dart';

import 'package:tara/main.dart';

void main() {
  testWidgets('Beranda renders home screen smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaraApp());

    expect(find.text('Tara'), findsOneWidget);
    expect(find.text('Status Koneksi Probe'), findsOneWidget);
    expect(find.text('Mulai Pengukuran'), findsOneWidget);
    expect(find.text('Daftar Pengukuran Terakhir'), findsOneWidget);
    expect(find.text('Wadah Tanam A1'), findsOneWidget);
    expect(find.text('Wadah Tanam B3'), findsOneWidget);
    expect(find.text('Wadah Tanam A2'), findsOneWidget);
    expect(find.text('Beranda'), findsOneWidget);
  });
}
