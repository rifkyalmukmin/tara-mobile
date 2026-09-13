import 'package:flutter/material.dart';

import 'screens/home_shell.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const TaraApp());
}

class TaraApp extends StatelessWidget {
  const TaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.brandGreen,
        ).copyWith(surface: AppColors.scaffoldBg),
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        useMaterial3: true,
      ),
      home: const HomeShell(),
    );
  }
}
