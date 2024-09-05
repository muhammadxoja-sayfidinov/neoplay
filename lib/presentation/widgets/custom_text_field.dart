import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.onSubmitted,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.focusNode,  // FocusNode qo'shildi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: TextField(
        onSubmitted: onSubmitted,
        focusNode: focusNode,  // FocusNode ni TextField ga bog'lash
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: lightGrey,
          hintText: hintText,
          hintStyle: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              color: lightGrey,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
