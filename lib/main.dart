import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/presentation/pages/splash_page.dart';

void main() {
  runApp(const ScubeApp());
}

class ScubeApp extends StatelessWidget {
  const ScubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scube Control & Monitoring',
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
