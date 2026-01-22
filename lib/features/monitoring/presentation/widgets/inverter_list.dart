import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/asset_manager.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/monitoring_data.dart';

class InverterList extends StatelessWidget {
  final List<Inverter> inverters;

  const InverterList({super.key, required this.inverters});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: inverters
          .map((inverter) => _InverterCard(inverter: inverter))
          .toList(),
    );
  }
}

class _InverterCard extends StatelessWidget {
  final Inverter inverter;

  const _InverterCard({required this.inverter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.s103, // Fixed height per user request
      margin: EdgeInsets.only(bottom: AppSizes.p16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.r8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.inputBorder)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  inverter.id,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      AssetManager.inverterPowerHeaderIcon,
                      width: 14.w,
                      height: 14.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      inverter.currentPower,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Body
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Row 1
                  Row(
                    children: [
                      Expanded(
                        child: _InfoItem(
                          iconPath: AssetManager.lifeEnergyIcon,
                          label: AppStrings.lifetimeEnergy,
                          value: inverter.lifetimeEnergy,
                          iconBg: AppColors.infoBg,
                        ),
                      ),
                      SizedBox(width: AppSizes.p8),
                      Expanded(
                        child: _InfoItem(
                          iconPath: AssetManager.todayEnergyIcon,
                          label: AppStrings.todayEnergy,
                          value: inverter.todayEnergy,
                          iconBg: AppColors.warningBg,
                        ),
                      ),
                    ],
                  ),
                  // Row 2
                  Row(
                    children: [
                      Expanded(
                        child: _InfoItem(
                          iconPath: AssetManager.prevMeterEnergyIcon,
                          label: AppStrings.prevMeterEnergy,
                          value: inverter.prevMeterEnergy,
                          iconBg: AppColors.errorBg,
                        ),
                      ),
                      SizedBox(width: AppSizes.p8),
                      Expanded(
                        child: _InfoItem(
                          iconPath: AssetManager.livePowerIcon,
                          label: AppStrings.livePower,
                          value: inverter.livePower,
                          iconBg: AppColors.successBg,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;
  final Color iconBg;

  const _InfoItem({
    required this.iconPath,
    required this.label,
    required this.value,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppSizes.s26,
          height: AppSizes.s26,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(AppSizes.r4),
          ),
          child: Image.asset(iconPath, fit: BoxFit.contain),
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 9.sp,
                  color: AppColors.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 11.sp,
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
    );
  }
}
