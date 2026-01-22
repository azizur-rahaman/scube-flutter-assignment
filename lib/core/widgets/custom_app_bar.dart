import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_sizes.dart';
import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showNotification;
  final VoidCallback? onLeadingPressed;
  final bool showLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showNotification = true,
    this.onLeadingPressed,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      centerTitle: true,
      leading: showLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: onLeadingPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: AppColors.textDarkBlue,
          fontSize: AppSizes.font18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (showNotification)
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.solidBell,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
