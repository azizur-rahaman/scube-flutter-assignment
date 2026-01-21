import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/monitoring_data.dart';

class ComparisonTable extends StatelessWidget {
  final ComparisonData comparison;

  const ComparisonTable({super.key, required this.comparison});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1.5),
        },
        border: TableBorder(
          horizontalInside: BorderSide(color: AppColors.inputBorder, width: 1),
        ),
        children: [
          _buildHeaderRow(),
          _buildRow(
            'AC Max Power',
            comparison.yesterday.acMaxPower,
            comparison.today.acMaxPower,
          ),
          _buildRow(
            'Net Energy',
            comparison.yesterday.netEnergy,
            comparison.today.netEnergy,
            isBold: true,
          ),
          _buildRow(
            'Specific Yield',
            comparison.yesterday.specificYield,
            comparison.today.specificYield,
          ),
          // Duplicate rows to match design roughly if needed, or stick to data
          // The design shows duplicated Net Energy and Specific Yield rows, perhaps for different meters?
          // Using provided data structure.
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: [
        SizedBox(height: 40.h),
        Center(
          child: Text(
            "Yesterday's Data",
            style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
          ),
        ),
        Center(
          child: Text(
            "Today's Data",
            style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
          ),
        ),
      ],
    );
  }

  TableRow _buildRow(
    String label,
    String val1,
    String val2, {
    bool isBold = false,
  }) {
    final style = TextStyle(
      fontSize: 12.sp,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: AppColors.textPrimary,
    );

    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: Text(
            label,
            style: style.copyWith(color: AppColors.textSecondary),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Center(child: Text(val1, style: style)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Center(child: Text(val2, style: style)),
        ),
      ],
    );
  }
}
