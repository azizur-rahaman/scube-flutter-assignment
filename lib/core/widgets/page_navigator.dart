import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';
import '../theme/app_colors.dart';

class PageNavigator extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PageNavigator({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.s32,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryCyan,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.r4),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.font12,
                fontWeight: FontWeight.bold,
                color: AppColors.textInverse,
              ),
            ),
            SizedBox(width: AppSizes.p4),
            Icon(
              Icons.arrow_forward_ios,
              size: AppSizes.font12,
              color: AppColors.textInverse,
            ),
          ],
        ),
      ),
    );
  }
}
