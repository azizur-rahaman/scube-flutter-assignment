import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/asset_manager.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/gradient_scrollbar.dart';
import '../../../../core/widgets/page_navigator.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class MonitoringDetailsPage extends StatefulWidget {
  const MonitoringDetailsPage({super.key});

  @override
  State<MonitoringDetailsPage> createState() => _MonitoringDetailsPageState();
}

class _MonitoringDetailsPageState extends State<MonitoringDetailsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueBg,
      appBar: const CustomAppBar(
        title: AppStrings.page2Title,
        showNotification: true, // Assuming we want notification bell here too
        showLeading:
            false, // The original page didn't have a functional leading back button in AppBar, it had a manual body button
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.p16),
        child: Column(
          children: [
            // 1. Top Navigation Button
            PageNavigator(
              title: AppStrings.firstPageNavigate,
              onPressed: () => context.go(AppRouter.monitoringPath),
            ),
            SizedBox(height: AppSizes.s16),

            // 2. Main Content Card
            Container(
              height: 537.h,
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
                        _buildTab(AppStrings.tabSummary, true),
                        _buildTab(AppStrings.tabSld, false),
                        _buildTab(AppStrings.tabData, false),
                      ],
                    ),
                  ),

                  // Content with horizontal padding
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
                    child: Column(
                      children: [
                        // Header
                        Padding(
                          padding: EdgeInsets.all(AppSizes.p16),
                          child: Text(
                            AppStrings.electricity,
                            style: GoogleFonts.inter(
                              fontSize: AppSizes.font16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        Divider(height: 1, color: AppColors.inputBorder),

                        // Chart Area
                        SizedBox(height: AppSizes.s16),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: AppSizes.s160,
                              height: AppSizes.s160,
                              child: CircularProgressIndicator(
                                value: 0.75,
                                strokeWidth: AppSizes.p20,
                                backgroundColor: Colors.blue.shade50,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.primaryBlue,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  AppStrings.totalPower,
                                  style: TextStyle(
                                    fontSize: AppSizes.font12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                Text(
                                  '5.53 kw',
                                  style: TextStyle(
                                    fontSize: AppSizes.font16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.s16),

                        // Source/Load Switcher
                        Container(
                          width: AppSizes.s200,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(AppSizes.r20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppSizes.s6,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue,
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.r16,
                                    ),
                                  ),
                                  child: Text(
                                    AppStrings.source,
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
                                    AppStrings.load,
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
                        SizedBox(height: AppSizes.s16),
                        Divider(thickness: 2, color: AppColors.inputBorder),
                      ],
                    ),
                  ),

                  // Data List - Expanded scrollable container
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: AppSizes.p16),
                      child: Stack(
                        children: [
                          GradientScrollbar(
                            controller: _scrollController,
                            thickness: 4.w,
                            radius: Radius.circular(AppSizes.r4),
                            gradient: AppColors.scrollbarGradient,
                            padding: EdgeInsets.only(right: 2.w),
                            child: ListView.separated(
                              controller: _scrollController,
                              padding: EdgeInsets.only(
                                right: AppSizes.p12,
                                bottom: AppSizes.p16,
                              ),
                              itemCount: 3,
                              separatorBuilder: (context, index) =>
                                  const SizedBox.shrink(),
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return _buildDataListItem(
                                    AssetManager.dataViewIcon,
                                    Colors.lightBlue,
                                    AppStrings.dataView,
                                    '55505.63',
                                    '58805.63',
                                    AppStrings.active,
                                  );
                                } else if (index == 1) {
                                  return _buildDataListItem(
                                    AssetManager.dataType2Icon,
                                    Colors.orange,
                                    AppStrings.dataType2,
                                    '55505.63',
                                    '58805.63',
                                    AppStrings.active,
                                  );
                                } else {
                                  return _buildDataListItem(
                                    AssetManager.dataType3Icon,
                                    Colors.lightBlue,
                                    AppStrings.dataType3,
                                    '55505.63',
                                    '58805.63',
                                    AppStrings.inactive,
                                  );
                                }
                              },
                            ),
                          ),
                          // Inner Shadow / Fade Overlay
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            height: 48.h,
                            child: IgnorePointer(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment
                                        .bottomCenter, // Appear from end
                                    end: Alignment.topCenter, // Spread to top
                                    colors: [
                                      Color(0xFF19416E).withOpacity(
                                        0.6,
                                      ), // 60% Opacity (Bottom)
                                      Color(
                                        0xFF2F548C,
                                      ).withOpacity(0.0), // 0% Opacity (Top)
                                    ],
                                  ),
                                ),
                              ),
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

            // Bottom Grid
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: AppSizes.p12,
              mainAxisSpacing: AppSizes.p12,
              children: [
                _buildGridItem(
                  AssetManager.analysisProIcon,
                  AppStrings.analysisPro,
                ),
                _buildGridItem(
                  AssetManager.gGeneratorIcon,
                  AppStrings.gGenerator,
                ),
                _buildGridItem(
                  AssetManager.plantSummaryIcon,
                  AppStrings.plantSummary,
                ),
                _buildGridItem(
                  AssetManager.naturalGasIcon,
                  AppStrings.naturalGas,
                ),
                _buildGridItem(
                  AssetManager.gGeneratorIcon,
                  AppStrings.dGenerator,
                ), // Reusing G Generator for D Generator as placeholder or if same icon
                _buildGridItem(
                  AssetManager.waterProcessIcon,
                  AppStrings.waterProcess,
                ),
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
                  topRight: Radius.circular(AppSizes.r10),
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
    String iconPath,
    Color color,
    String title,
    String d1,
    String d2,
    String status,
  ) {
    final isInactive = status == AppStrings.inactive;
    return Container(
      padding: EdgeInsets.all(AppSizes.p12),
      margin: EdgeInsets.only(bottom: AppSizes.p8),
      decoration: BoxDecoration(
        color: Color(0xFFE5F4FE),
        border: Border.all(
          color: AppColors.primaryBlue.withOpacity(0.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.p8),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.inputBorder.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(AppSizes.r8),
            ),
            child: Image.asset(
              iconPath,
              width: AppSizes.iconMedium,
              height: AppSizes.iconMedium,
            ),
          ),
          SizedBox(width: AppSizes.p12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: AppSizes.p8,
                      height: AppSizes.p8,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(
                          AppSizes.r2,
                        ), // approximating r2
                      ),
                    ),
                    SizedBox(width: AppSizes.p4),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.font14,
                      ),
                    ),
                    SizedBox(width: AppSizes.p4),
                    Text(
                      '($status)',
                      style: TextStyle(
                        color: isInactive ? Colors.red : Colors.blue,
                        fontSize: AppSizes.font10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.p4),
                Text(
                  '${AppStrings.data1}$d1',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.font12,
                  ),
                ),
                Text(
                  '${AppStrings.data2}$d2',
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
            size: AppSizes.font14,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String iconPath, String title) {
    return Container(
      height: AppSizes.s42,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.r8),
        border: Border.all(color: Color(0xFFB6B8D0), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.p4),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Image.asset(
              iconPath,
              width: AppSizes.icon20,
              height: AppSizes.icon20,
            ),
          ),
          SizedBox(width: AppSizes.p8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppSizes.font14,
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
