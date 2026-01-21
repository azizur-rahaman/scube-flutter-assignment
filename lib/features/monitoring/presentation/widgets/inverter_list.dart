import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';
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
      margin: EdgeInsets.only(bottom: AppSizes.p16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10.r),
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.inputBorder)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  inverter.id,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.bolt, color: Colors.blue, size: 16.sp),
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
          // Body Grid
          Padding(
            padding: EdgeInsets.all(16.w),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 16.w,
              children: [
                _InfoItem(
                  icon: Icons.electric_bolt,
                  label: 'Lifetime Energy',
                  value: inverter.lifetimeEnergy,
                  iconBg: Colors.lightBlue.shade50,
                  iconColor: Colors.lightBlue,
                ),
                _InfoItem(
                  icon: Icons.hourglass_bottom,
                  label: 'Today Energy',
                  value: inverter.todayEnergy,
                  iconBg: Colors.amber.shade50,
                  iconColor: Colors.amber,
                ),
                _InfoItem(
                  icon: Icons.history, // Placeholder for meter
                  label: 'Prev. Meter Energy',
                  value: inverter.prevMeterEnergy,
                  iconBg: Colors.orange.shade50,
                  iconColor: Colors.orange,
                ),
                _InfoItem(
                  icon: Icons.speed,
                  label: 'Live Power',
                  value: inverter.livePower,
                  iconBg: Colors.purple.shade50,
                  iconColor: Colors.purple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconBg;
  final Color iconColor;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconBg,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
          child: Icon(icon, size: 16.sp, color: iconColor),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 10.sp, color: AppColors.textSecondary),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
