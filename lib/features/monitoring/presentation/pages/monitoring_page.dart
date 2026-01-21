import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../injection_container.dart';
import '../bloc/monitoring_bloc.dart';
import '../widgets/dashboard_stats_grid.dart';
import '../widgets/weather_card.dart';
import '../widgets/comparison_table.dart';
import '../widgets/inverter_list.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MonitoringBloc>()..add(LoadMonitoringData()),
      child: Scaffold(
        backgroundColor: Color(0xFFE8F1F8), // Light bluish gray background
        appBar: AppBar(
          backgroundColor: Colors.white, // White AppBar
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () {}, // Or GoRouter.pop
          ),
          centerTitle: true,
          title: Text(
            '1st Page',
            style: GoogleFonts.inter(
              // Using Inter or similar modern font
              color: AppColors.textDarkBlue,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () {},
                ),
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 8.w),
          ],
        ),
        body: BlocBuilder<MonitoringBloc, MonitoringState>(
          builder: (context, state) {
            if (state is MonitoringLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MonitoringError) {
              return Center(child: Text(state.message));
            } else if (state is MonitoringLoaded) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.p16,
                  vertical: AppSizes.p16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Navigate Button
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan, // Cyan/Aqua color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2nd Page Navigate',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.s16),

                    // Stats Grid
                    DashboardStatsGrid(data: state.data),
                    SizedBox(height: AppSizes.s16),

                    // Weather Card
                    WeatherCard(weather: state.data.weather),
                    SizedBox(height: AppSizes.s16),

                    // Comparison Table
                    ComparisonTable(comparison: state.data.comparison),
                    SizedBox(height: AppSizes.s16),

                    // System Info Header
                    Container(
                      padding: EdgeInsets.all(12.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.solar_power_outlined,
                            size: 20.sp,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Total Num of PV Module  :  ',
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: state.data.systemInfo.pvModules,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.s16),

                    // Capacity Grid
                    _buildCapacityGrid(state.data.systemInfo),
                    SizedBox(height: AppSizes.s16),

                    // Inverter List
                    InverterList(inverters: state.data.inverters),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildCapacityGrid(systemInfo) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _InfoTile(
                icon: Icons.speed,
                label: 'Total AC Capacity',
                value: systemInfo.totalAcCapacity,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _InfoTile(
                icon: Icons.speed,
                label: 'Total DC Capacity',
                value: systemInfo.totalDcCapacity,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _InfoTile(
                icon: Icons.calendar_today,
                label: 'Date of Commissioning',
                value: systemInfo.commissioningDate,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _InfoTile(
                icon: Icons.grid_view,
                label: 'Number of Inverter',
                value: systemInfo.inverterCount,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        // The image shows repeated rows of AC/DC? I will just follow the JSON data structure for now.
        // Or duplicate if strictly following the image visual which has 3 rows.
        // Let's stick to unique data to be clean.
        Row(
          children: [
            Expanded(
              child: _InfoTile(
                icon: Icons.speed,
                label: 'Total AC Capacity',
                value: systemInfo.totalAcCapacity,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: _InfoTile(
                icon: Icons.speed,
                label: 'Total DC Capacity',
                value: systemInfo.totalDcCapacity,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: Colors.blue.withOpacity(0.1),
            child: Icon(icon, size: 18.sp, color: Colors.blue),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  value, // Using the value as requested
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
