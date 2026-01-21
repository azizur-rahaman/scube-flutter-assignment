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
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSizes.s60),
              // Logo
              SizedBox(
                width: AppSizes.s120,
                height: AppSizes.s120,
                child: Image.asset(AssetManager.brandLogo),
              ),
              // SizedBox(height: AppSizes.s24),
              Text(
                'SCUBE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.font24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // SizedBox(height: AppSizes.s8),
              Text(
                'Control & Monitoring System',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.font20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
