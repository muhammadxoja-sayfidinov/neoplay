import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';




class CustomTextStyle {
  CustomTextStyle._();

  static TextStyle style400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24.sp,
    color:Colors.white,
  );
  static TextStyle style500 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 28.sp,
    color: lightGrey,
  );
  static TextStyle style600 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 66.sp,
    color: Colors.white,
  );

}