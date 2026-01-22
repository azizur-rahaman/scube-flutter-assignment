import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/monitoring_data.dart';

class ComparisonTable extends StatelessWidget {
  final ComparisonData comparison;

  const ComparisonTable({super.key, required this.comparison});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface, // Container background
        borderRadius: BorderRadius.circular(AppSizes.r8),
      ),
      clipBehavior: Clip.antiAlias, // To clip children to border radius
      child: Column(
        children: [
          // Header Row
          _buildHeaderRow(),

          // Data Rows (Zebra Striped)
          _buildDataRow(
            label: AppStrings.acMaxPower,
            valYesterday: comparison.yesterday.acMaxPower,
            valToday: comparison.today.acMaxPower,
            index: 0,
          ),
          _buildDataRow(
            label: AppStrings.netEnergy,
            valYesterday: comparison.yesterday.netEnergy,
            valToday: comparison
                .yesterday
                .netEnergy, // Using netEnergy for comparison
            index: 1,
          ),
          _buildDataRow(
            label: AppStrings.specificYield,
            valYesterday: comparison.yesterday.specificYield,
            valToday: comparison.today.specificYield,
            index: 2,
          ),
          _buildDataRow(
            label: AppStrings.netEnergy,
            valYesterday: comparison.yesterday.netEnergy,
            valToday: comparison.yesterday.netEnergy,
            index: 3,
          ),
          _buildDataRow(
            label: AppStrings.specificYield,
            valYesterday: comparison.yesterday.specificYield,
            valToday: comparison.today.specificYield,
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      height: AppSizes.s31,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.inputBorder, width: 1.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: SizedBox.shrink()), // Empty first column
          Expanded(
            flex: 2,
            child: Text(
              AppStrings.yesterdaysData,
              textAlign: TextAlign
                  .left, // Align right usually looks cleaner for columns
              style: TextStyle(
                fontSize: AppSizes.font12,
                color: AppColors
                    .textPrimary, // Changed to darker color based on image
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: AppSizes.p4),
          Expanded(
            flex: 2,
            child: Text(
              AppStrings.todaysData,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: AppSizes.font12,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow({
    required String label,
    required String valYesterday,
    required String valToday,
    required int index,
  }) {
    // Zebra striping: Even rows (0, 2...) are white, Odd rows (1, 3...) are light blue
    // Looking at the image: Row 1 (AC) = White. Row 2 (Net) = Light Blue. Row 3 (Specific) = White.
    final bool isEven = index % 2 == 0;
    final backgroundColor = isEven
        ? AppColors.surface
        : AppColors.tableRowHighlight;

    return Container(
      height: AppSizes.s31, // Fixed height per user request
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      alignment: Alignment.centerLeft, // Align content vertically center
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: AppSizes.font12,
                color: AppColors.textPrimary, // Darker text for labels too
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              valYesterday,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: AppSizes.font12,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold, // Bolding the numeric values
              ),
            ),
          ),
          SizedBox(width: AppSizes.p4),
          Expanded(
            flex: 2,
            child: Text(
              valToday,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: AppSizes.font12,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
