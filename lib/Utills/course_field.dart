import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_managment_system/Utills/colors.dart';

class BuildTextInput extends StatelessWidget {
  String label;
  String hintText;
  int maxLines = 1;
  TextEditingController? controller;
  BuildTextInput({
    super.key,
    required this.label,
    required this.hintText,
    required this.maxLines,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: TextField(
            maxLines: maxLines,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}
