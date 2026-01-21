import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppSizes.p24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Area
                Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.bolt, color: Colors.white, size: 40.sp),
                ),
                SizedBox(height: AppSizes.s16),
                Text(
                  'SCUBE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.font20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Control & Monitoring System',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: AppSizes.font12,
                  ),
                ),
                SizedBox(height: AppSizes.s40),

                // Login Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.r20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.p24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: AppSizes.font22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: AppSizes.s24),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                        SizedBox(height: AppSizes.s16),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility_off),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        SizedBox(height: AppSizes.s16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to Home
                              GoRouter.of(context).go('/home');
                            },
                            child: const Text('Login'),
                          ),
                        ),
                        SizedBox(height: AppSizes.s16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Register Now'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
