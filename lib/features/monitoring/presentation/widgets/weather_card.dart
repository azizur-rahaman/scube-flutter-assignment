import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/asset_manager.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/monitoring_data.dart';

class WeatherCard extends StatelessWidget {
  final WeatherInfo weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.s80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.r16),
        gradient: const LinearGradient(
          colors: [Color(0xFF5B7FFF), Color(0xFFA678D6)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Section (Temperature)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.p8,
                vertical: AppSizes.p6,
              ),
              width: AppSizes.s135,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.all(Radius.circular(AppSizes.r16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weather.temperature,
                          style: TextStyle(
                            fontSize: AppSizes.icon20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                            height: 1.0,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          AppStrings.moduleTemperature,
                          style: TextStyle(
                            fontSize: AppSizes.font10, // Reduced font size
                            color: AppColors.textSecondary,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Thermometer Icon
                  SizedBox(
                    height: 60.h, // Reduced from 90 to 60 to fit 80h container
                    width: 30.w,
                    child: Image.asset(
                      AssetManager.thermometerIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            // Right Section (Wind & Irradiation)
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.p12,
                  vertical: AppSizes.p6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppSizes.r16),
                    bottomRight: Radius.circular(AppSizes.r16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Wind Speed
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.windSpeed,
                              style: TextStyle(
                                fontSize: AppSizes.font12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              AppStrings.windSpeedDirection,
                              style: TextStyle(
                                fontSize:
                                    AppSizes.font8, // Very small textual label
                                color: Colors.white70,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h), // Minimal spacing
                        // Irradiation
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.irradiation,
                              style: TextStyle(
                                fontSize: AppSizes.font12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              AppStrings.effectiveIrradiation,
                              style: TextStyle(
                                fontSize: AppSizes.font8,
                                color: Colors.white70,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.wb_cloudy_outlined,
                      color: Colors.white.withOpacity(0.8),
                      size: AppSizes.iconMedium, // Reduced from Large
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
