import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pingolearn/core/manager/color_manager.dart";
import "package:responsive_sizer/responsive_sizer.dart";


TextStyle logoFont = GoogleFonts.poppins(
  fontSize: 3.h,
  color: brandLiteBlue,
  fontWeight: FontWeight.w800
);


TextStyle buttonFont = GoogleFonts.poppins(
    fontSize: 1.8.h,
    color: Colors.white,
    fontWeight: FontWeight.w600
);


TextStyle richTextFont = GoogleFonts.poppins(
    fontSize: 2.h,
    color: Colors.black87,
  fontWeight: FontWeight.w500
);

TextStyle appTitleFont = GoogleFonts.poppins(
    fontSize: 2.h,
    color: Colors.white,
    fontWeight: FontWeight.w500
);

TextStyle productTitleFont = GoogleFonts.poppins(
    fontSize: 1.6.h,
    color: Colors.black,
    fontWeight: FontWeight.w700
);

TextStyle productDecFont = GoogleFonts.poppins(
    fontSize: 1.4.h,
    color: Colors.black,

);

TextStyle productDiscountFont = GoogleFonts.poppins(
    fontSize: 1.4.h,
    color: Colors.grey,
    decoration: TextDecoration.lineThrough

);

TextStyle productPriceFont = GoogleFonts.poppins(
    fontSize: 1.4.h,
    color: Colors.black,

);

TextStyle productDiscountPercentFont = GoogleFonts.poppins(
    fontSize: 1.4.h,
    color: Colors.greenAccent,
);