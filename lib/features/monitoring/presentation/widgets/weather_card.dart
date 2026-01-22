import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';

class WeatherCard extends StatelessWidget {
  final String mainTitle;
  final String mainSubTitle;
  final String mainIconPath;
  final String secondaryTopTitle;
  final String secondaryTopSubTitle;
  final String secondaryBottomTitle;
  final String secondaryBottomSubTitle;
  final String secondaryIconPath;

  const WeatherCard({
    super.key,
    required this.mainTitle,
    required this.mainSubTitle,
    required this.mainIconPath,
    required this.secondaryTopTitle,
    required this.secondaryTopSubTitle,
    required this.secondaryBottomTitle,
    required this.secondaryBottomSubTitle,
    required this.secondaryIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.s80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.r8),
        gradient: AppColors.weatherGradient,
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
                borderRadius: BorderRadius.all(Radius.circular(AppSizes.r8)),
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
                          mainTitle,
                          style: TextStyle(
                            fontSize: AppSizes.icon20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                            height: 1.0,
                          ),
                        ),
                        SizedBox(height: AppSizes.s2),
                        Text(
                          mainSubTitle,
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
                    height: AppSizes
                        .s60, // Reduced from 90 to 60 to fit 80h container
                    width: AppSizes.s30,
                    child: Image.asset(mainIconPath, fit: BoxFit.contain),
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
                              secondaryTopTitle,
                              style: TextStyle(
                                fontSize: AppSizes.font16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              secondaryTopSubTitle,
                              style: TextStyle(
                                fontSize:
                                    AppSizes.font10, // Very small textual label
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.s4), // Minimal spacing
                        // Irradiation
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Parse irradiation string "15.20 w/m²" -> ["15.20", "w/m²"]
                            Builder(
                              builder: (context) {
                                final parts = secondaryBottomTitle.split(' ');
                                final value = parts.isNotEmpty ? parts[0] : '';
                                final unit = parts.length > 1
                                    ? ' ${parts.sublist(1).join(' ')}'
                                    : '';

                                return RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: value,
                                        style: TextStyle(
                                          fontSize: AppSizes.font16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          height: 1.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: unit,
                                        style: TextStyle(
                                          fontSize: AppSizes.font11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          height: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Text(
                              secondaryBottomSubTitle,
                              style: TextStyle(
                                fontSize: AppSizes.font10,
                                color: Colors.white70,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.s48,
                      width: AppSizes.s57,
                      child: Image.asset(secondaryIconPath),
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
