import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/constants/asset_manager.dart';
import '../../../../injection_container.dart';
import '../bloc/monitoring_bloc.dart';
import '../widgets/dashboard_stats_grid.dart';
import '../widgets/weather_carousel.dart';
import '../../../../core/widgets/page_navigator.dart';
import '../widgets/comparison_table.dart';
import '../widgets/inverter_list.dart';
import '../widgets/info_tile.dart';

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
                  icon: const FaIcon(
                    FontAwesomeIcons.bell,
                    color: AppColors.textPrimary,
                    size: 20,
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
            SizedBox(width: AppSizes.p12),
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
                    PageNavigator(
                      title: AppStrings.secondPageNavigate,
                      onPressed: () =>
                          context.push(AppRouter.monitoringDetailsPath),
                    ),
                    SizedBox(height: AppSizes.s16),

                    // Stats Grid
                    DashboardStatsGrid(data: state.data),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.p4,
                        vertical: AppSizes.p6,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppSizes.r8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetManager.totalNumOfPvModuleIcon,
                            width: AppSizes.icon22,
                            height: AppSizes.icon22,
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
              child: InfoTile(
                iconPath: AssetManager.totalAcCapacityIcon,
                label: AppStrings.totalAcCapacity,
                value: systemInfo.totalAcCapacity,
              ),
            ),
            SizedBox(width: AppSizes.p8),
            Expanded(
              child: InfoTile(
                iconPath: AssetManager.totalDcCapacityIcon,
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
              child: InfoTile(
                iconPath: AssetManager.dateOfCommissioningIcon,
                label: AppStrings.dateOfCommissioning,
                value: systemInfo.commissioningDate,
              ),
            ),
            SizedBox(width: AppSizes.p8),
            Expanded(
              child: InfoTile(
                iconPath: AssetManager.numberOfInverterIcon,
                label: AppStrings.numberOfInverter,
                value: systemInfo.inverterCount,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.s8),
        Row(
          children: [
            Expanded(
              child: InfoTile(
                iconPath: AssetManager.totalAcCapacityIcon,
                label: AppStrings.totalAcCapacity,
                value: systemInfo.totalAcCapacity,
              ),
            ),
            SizedBox(width: AppSizes.p8),
            Expanded(
              child: InfoTile(
                iconPath: AssetManager.totalDcCapacityIcon,
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
