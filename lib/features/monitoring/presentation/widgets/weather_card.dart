import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/monitoring_data.dart';

class WeatherCard extends StatelessWidget {
  final WeatherInfo weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.p16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6A85B6), Color(0xFFBAC8E0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weather.temperature,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Module Temperature',
                style: TextStyle(fontSize: 12.sp, color: Colors.white70),
              ),
            ],
          ),

          // Thermometer Icon (Simplistic representation)
          Icon(Icons.thermostat, color: Colors.white, size: 40.sp),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weather.windSpeed,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Wind Speed & Direction',
                style: TextStyle(fontSize: 10.sp, color: Colors.white70),
              ),
              SizedBox(height: 8.h),
              Text(
                weather.irradiation,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Effective Irradiation',
                style: TextStyle(fontSize: 10.sp, color: Colors.white70),
              ),
            ],
          ),
          Icon(Icons.wb_sunny, color: Colors.yellow, size: 40.sp),
        ],
      ),
    );
  }
}
