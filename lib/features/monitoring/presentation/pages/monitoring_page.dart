import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../injection_container.dart';
import '../bloc/monitoring_bloc.dart';
import '../widgets/dashboard_stats_grid.dart';
import '../widgets/weather_carousel.dart';
import '../widgets/comparison_table.dart';
import '../widgets/inverter_list.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MonitoringBloc>()..add(LoadMonitoringData()),
      child: Scaffold(
        backgroundColor: AppColors.lightBlueBg, // Light bluish gray background
        appBar: AppBar(
          backgroundColor: AppColors.surface, // White AppBar
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () {}, // Or GoRouter.pop
          ),
          centerTitle: true,
          title: Text(
            AppStrings.page1Title,
            style: GoogleFonts.inter(
              // Using Inter or similar modern font
              color: AppColors.textDarkBlue,
              fontSize: AppSizes.font18,
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
                  top: AppSizes.s12,
                  right: AppSizes.p12,
                  child: Container(
                    width: AppSizes.p8,
                    height: AppSizes.p8,
                    decoration: const BoxDecoration(
                      color: AppColors.notificationRed,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: AppSizes.p8),
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
                      height: AppSizes.s48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.secondaryCyan, // Cyan/Aqua color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.r8),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.navigateButton,
                              style: TextStyle(
                                fontSize: AppSizes.font16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textInverse,
                              ),
                            ),
                            SizedBox(width: AppSizes.p4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: AppSizes.iconSmall,
                              color: AppColors.textInverse,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.s16),

                    // Stats Grid
                    DashboardStatsGrid(data: state.data),
                    SizedBox(height: AppSizes.s16),

                    // Weather Carousel
                    WeatherCarousel(
                      temperature: state.data.weather.temperature,
                      windSpeed: state.data.weather.windSpeed,
                      irradiation: state.data.weather.irradiation,
                    ),

                    SizedBox(height: AppSizes.s16),

                    // Comparison Table
                    ComparisonTable(comparison: state.data.comparison),
                    SizedBox(height: AppSizes.s16),

                    // System Info Header
                    Container(
                      padding: EdgeInsets.all(AppSizes.p12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppSizes.r8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.solar_power_outlined,
                            size: AppSizes.icon20,
                            color: AppColors.primaryBlue,
                          ),
                          SizedBox(width: AppSizes.p8),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.totalPvModules,
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: AppSizes.font12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: state.data.systemInfo.pvModules,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSizes.font12,
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
                label: AppStrings.totalAcCapacity,
                value: systemInfo.totalAcCapacity,
              ),
            ),
            SizedBox(width: AppSizes.p8),
            Expanded(
              child: _InfoTile(
                icon: Icons.speed,
                label: AppStrings.totalDcCapacity,
                value: systemInfo.totalDcCapacity,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.s8),
        Row(
          children: [
            Expanded(
              child: _InfoTile(
                icon: Icons.calendar_today,
                label: AppStrings.dateOfCommissioning,
                value: systemInfo.commissioningDate,
              ),
            ),
            SizedBox(width: AppSizes.p8),
            Expanded(
              child: _InfoTile(
                icon: Icons.grid_view,
                label: AppStrings.numberOfInverter,
                value: systemInfo.inverterCount,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.s8),
        // The image shows repeated rows of AC/DC? I will just follow the JSON data structure for now.
        // Or duplicate if strictly following the image visual which has 3 rows.
        // Let's stick to unique data to be clean.
        Row(
          children: [
            Expanded(
              child: _InfoTile(
                icon: Icons.speed,
                label: AppStrings.totalAcCapacity,
                value: systemInfo.totalAcCapacity,
              ),
            ),
            SizedBox(width: AppSizes.p8),
            Expanded(
              child: _InfoTile(
                icon: Icons.speed,
                label: AppStrings.totalDcCapacity,
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
      padding: EdgeInsets.all(AppSizes.p12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSizes.r16,
            backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
            child: Icon(
              icon,
              size: AppSizes.icon18,
              color: AppColors.primaryBlue,
            ),
          ),
          SizedBox(width: AppSizes.p8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: AppSizes.font10,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  value, // Using the value as requested
                  style: TextStyle(
                    fontSize: AppSizes.font12,
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
