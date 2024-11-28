import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: const Border(
          right: BorderSide.none,
          bottom: BorderSide.none,
          left: BorderSide.none,
        ),
        color: Colors.white, // Background color
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor, // Shadow color
            blurRadius: 0.2, // Blur radius
            spreadRadius: 0.2, // Spread radius
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              // backgroundColor: AppColor.boxColor,
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
