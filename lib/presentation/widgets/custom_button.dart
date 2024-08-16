

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/style.dart';
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name ;
  final double width;
  final Color color;



  const CustomButton({
    Key?key,
    required this.color,
    required this.width,
    required this.name,
    required this.onPressed
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ,
      height: 64.h,

      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28.sp,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
