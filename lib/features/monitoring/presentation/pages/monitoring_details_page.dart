import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';

class MonitoringDetailsPage extends StatelessWidget {
  const MonitoringDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueBg,
      appBar: AppBar(
        title: Text(
          '2nd Page',
          style: GoogleFonts.inter(
            color: AppColors.textDarkBlue,
            fontSize: AppSizes.font18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.surface,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.bell,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
          SizedBox(width: AppSizes.p12),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.p16),
        child: Column(
          children: [
            // 1. Top Navigation Button
            SizedBox(
              width: double.infinity,
              height: AppSizes.s32,
              child: ElevatedButton(
                onPressed: () {
                  context.pop(); // Go back to 1st Page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryCyan,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.r4),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1st Page Navigate',
                      style: TextStyle(
                        fontSize: AppSizes.font12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textInverse,
                      ),
                    ),
                    SizedBox(width: AppSizes.p4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: AppSizes.font12,
                      color: AppColors.textInverse,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSizes.s16),

            // 2. Main Content Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSizes.r10),
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
                  // Tabs
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.inputBorder,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        _buildTab('Summary', true),
                        _buildTab('SLD', false),
                        _buildTab('Data', false),
                      ],
                    ),
                  ),

                  // Header
                  Padding(
                    padding: EdgeInsets.all(AppSizes.p16),
                    child: Text(
                      'Electricity',
                      style: GoogleFonts.inter(
                        fontSize: AppSizes.font16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Divider(height: 1, color: AppColors.inputBorder),

                  // Chart Area
                  SizedBox(height: AppSizes.s24),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 160.w,
                        height: 160.w,
                        child: CircularProgressIndicator(
                          value: 0.75,
                          strokeWidth: 20.w,
                          backgroundColor: Colors.blue.shade50,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.lightBlue,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total Power',
                            style: TextStyle(
                              fontSize: AppSizes.font12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            '5.53 kw',
                            style: TextStyle(
                              fontSize: AppSizes.font18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDarkBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.s24),

                  // Source/Load Switcher
                  Container(
                    width: 200.w,
                    padding: EdgeInsets.all(AppSizes.p4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Source',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSizes.font12,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Load',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSizes.font12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.s24),
                  Divider(height: 1, color: AppColors.inputBorder),

                  // Data List
                  _buildDataListItem(
                    Icons.solar_power,
                    Colors.lightBlue,
                    'Data View',
                    '55505.63',
                    '58805.63',
                    'Active',
                  ),
                  Divider(height: 1, color: AppColors.inputBorder),
                  _buildDataListItem(
                    Icons.battery_charging_full,
                    Colors.orange,
                    'Data Type 2',
                    '55505.63',
                    '58805.63',
                    'Active',
                  ),
                  Divider(height: 1, color: AppColors.inputBorder),
                  _buildDataListItem(
                    Icons.electric_bolt,
                    Colors.lightBlue,
                    'Data Type 3',
                    '55505.63',
                    '58805.63',
                    'Inactive',
                    isLast: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.s16),

            // Bottom Grid
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              crossAxisSpacing: AppSizes.p12,
              mainAxisSpacing: AppSizes.p12,
              children: [
                _buildGridItem(Icons.analytics, 'Analysis Pro'),
                _buildGridItem(Icons.bolt, 'G. Generator'),
                _buildGridItem(Icons.energy_savings_leaf, 'Plant Summery'),
                _buildGridItem(Icons.local_fire_department, 'Natural Gas'),
                _buildGridItem(Icons.bolt, 'D. Generator'),
                _buildGridItem(Icons.water_drop, 'Water Process'),
              ],
            ),
            SizedBox(height: AppSizes.s24),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.p12),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.transparent,
          borderRadius: isActive
              ? BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.r10),
                ) // Visual fix approx
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.font14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataListItem(
    IconData icon,
    Color color,
    String title,
    String d1,
    String d2,
    String status, {
    bool isLast = false,
  }) {
    final isInactive = status == 'Inactive';
    return Container(
      padding: EdgeInsets.all(AppSizes.p12),
      decoration: isLast
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.blue.shade50.withOpacity(0.5)],
              ),
            )
          : null,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.inputBorder.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(AppSizes.r8),
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(width: AppSizes.p12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.font14,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '($status)',
                      style: TextStyle(
                        color: isInactive ? Colors.red : Colors.blue,
                        fontSize: AppSizes.font10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'Data 1    :  $d1',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.font12,
                  ),
                ),
                Text(
                  'Data 2    :  $d2',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.font12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 14.sp,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.r8),
        border: Border.all(color: AppColors.inputBorder.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.orange.shade50, // Placeholder bg
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              icon,
              size: 20.sp,
              color: Colors.orange,
            ), // Placeholder color
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.font12,
                color: AppColors.textSecondary,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
