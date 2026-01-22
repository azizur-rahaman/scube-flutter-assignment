import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';

class InfoTile extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.p12,
        vertical: AppSizes.p8,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Row(
        children: [
          Container(
            width: AppSizes.s32,
            height: AppSizes.s32,
            decoration: BoxDecoration(
              color: AppColors.lightBlueBg,
              borderRadius: BorderRadius.circular(AppSizes.r8),
            ),
            padding: EdgeInsets.all(AppSizes.p6),
            child: Image.asset(iconPath, fit: BoxFit.contain),
          ),
          SizedBox(width: AppSizes.p8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: AppSizes.font10,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSizes.p2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: AppSizes.font12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
