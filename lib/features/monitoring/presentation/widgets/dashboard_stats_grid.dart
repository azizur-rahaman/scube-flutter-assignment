import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
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
        label: 'Live AC Power',
        iconColor: Colors.green,
      ),
      _StatItem(
        icon: Icons.solar_power,
        value: data.plantGeneration,
        label: 'Plant Generation',
        iconColor: Colors.teal,
      ),
      _StatItem(
        icon: Icons.speed,
        value: data.livePr,
        label: 'Live PR',
        iconColor: Colors.indigo,
      ),
      _StatItem(
        icon: Icons.percent,
        value: data.cumulativePr,
        label: 'Cumulative PR',
        iconColor: Colors.blue,
      ),
      _StatItem(
        icon: Icons.monetization_on,
        value: data.returnPv,
        label: 'Return PV(In Today)',
        iconColor: Colors.orange,
      ),
      _StatItem(
        icon: Icons.electric_bolt,
        value: data.totalEnergy,
        label: 'Total Energy',
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
        childAspectRatio: 0.9,
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
      padding: EdgeInsets.all(8.w),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14.r,
            backgroundColor: item.iconColor.withOpacity(0.1),
            child: Icon(item.icon, size: 16.sp, color: item.iconColor),
          ),
          SizedBox(height: 8.h),
          Text(
            item.value,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            item.label,
            style: TextStyle(fontSize: 10.sp, color: AppColors.textSecondary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
