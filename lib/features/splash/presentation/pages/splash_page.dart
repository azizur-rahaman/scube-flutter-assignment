import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/asset_manager.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    debugPrint('SplashPage: initState');
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    debugPrint('SplashPage: Waiting for 3 seconds');

    await Future.delayed(const Duration(seconds: 3));

    debugPrint('SplashPage: Navigate to Login');

    if (mounted) {
      context.go('/login');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('SplashPage: build');
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            SizedBox(
              width: AppSizes.s120,
              height: AppSizes.s120,
              child: Image.asset(AssetManager.brandLogo),
            ),
            SizedBox(height: AppSizes.s24),
            Text(
              'SCUBE',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppSizes.font24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: AppSizes.s8),
            Text(
              'Control & Monitoring System',
              style: TextStyle(
                color: Colors.white70,
                fontSize: AppSizes.font14,
              ),
            ),
            SizedBox(height: AppSizes.s48),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
