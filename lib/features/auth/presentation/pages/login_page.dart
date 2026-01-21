import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/asset_manager.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    debugPrint('SplashPage: initState');

    // Initialize Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Define Slide Animation (Offset from bottom to original position)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Starts below the screen
      end: Offset.zero, // Ends at original position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Start Animation after small delay
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _controller.forward();
      }
    });

    _navigateToLogin();
  }

  void _navigateToLogin() async {
    // Only kept for reference or if used as a splash fallback, but keeping as is for now
    debugPrint('SplashPage: Waiting for 3 seconds');
    await Future.delayed(const Duration(seconds: 3));
    debugPrint('SplashPage: Navigate to Login');
    if (mounted) {
      // context.go('/login');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('SplashPage: build');
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.surface,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              color: AppColors.primaryBlue,
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
                      color: AppColors.textInverse,
                      fontSize: AppSizes.font24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // SizedBox(height: AppSizes.s8),
                  Text(
                    'Control & Monitoring System',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textInverse,
                      fontSize: AppSizes.font20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSizes.s40),
                  Expanded(
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r),
                          ),
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.p24,
                            vertical: AppSizes.p32,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors
                                        .textDarkBlue, // Dark blue like in image
                                  ),
                                ),
                              ),
                              SizedBox(height: AppSizes.s32),

                              // Username
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      color: AppColors.inputBorder,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: AppSizes.s16),

                              // Password
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: const Icon(
                                    Icons.visibility_outlined,
                                    color: AppColors.textSecondary,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      color: AppColors.inputBorder,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: AppSizes.s8),

                              // Forgot Password
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Forget password?',
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: AppSizes.s24),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    GoRouter.of(context).go('/home');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textInverse,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: AppSizes.s24),

                              // Register
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have any account? ",
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Register Now",
                                      style: TextStyle(
                                        color: AppColors.primaryBlue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
