import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/monitoring_data.dart';

class DashboardStatsGrid extends StatelessWidget {
  final MonitoringData data;

  const DashboardStatsGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final stats = [
      _StatItem(
        icon: Icons.bolt,
        value: data.currentPower,
        label: AppStrings.liveAcPower,
        iconColor: Colors.green,
      ),
      _StatItem(
        icon: Icons.solar_power,
        value: data.plantGeneration,
        label: AppStrings.plantGeneration,
        iconColor: Colors.teal,
      ),
      _StatItem(
        icon: Icons.speed,
        value: data.livePr,
        label: AppStrings.livePr,
        iconColor: Colors.indigo,
      ),
      _StatItem(
        icon: Icons.percent,
        value: data.cumulativePr,
        label: AppStrings.cumulativePr,
        iconColor: Colors.blue,
      ),
      _StatItem(
        icon: Icons.monetization_on,
        value: data.returnPv,
        label: AppStrings.returnPv,
        iconColor: Colors.orange,
      ),
      _StatItem(
        icon: Icons.electric_bolt,
        value: data.totalEnergy,
        label: AppStrings.totalEnergy,
        iconColor: Colors.purple,
      ),
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 2.0, // Compact height but enough for 2-line labels
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        return _StatCard(item: stats[index]);
      },
    );
  }
}

class _StatItem {
  final IconData icon;
  final String value;
  final String label;
  final Color iconColor;

  _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.iconColor,
  });
}

class _StatCard extends StatelessWidget {
  final _StatItem item;

  const _StatCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12.r,
            backgroundColor: item.iconColor.withOpacity(0.1),
            child: Icon(item.icon, size: 14.sp, color: item.iconColor),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.value,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
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
