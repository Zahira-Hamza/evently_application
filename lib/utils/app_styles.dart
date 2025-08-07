import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  //google fonts
  static final TextStyle bold20blue = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.bluePrimaryColor,
  );

  static final TextStyle medium16black = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackPrimaryColor,
  );
  static final TextStyle medium16gray = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static final TextStyle medium16blue = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.bluePrimaryColor,
  );
  static final TextStyle medium16white = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.whitePrimaryColor,
  );

  static final TextStyle bold20black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static final TextStyle bold20white = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final TextStyle bold12white = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
