import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomEnterButton extends StatelessWidget {
  final String svg;
  final String text;
  final VoidCallback onPressed;

  CustomEnterButton({
    Key?key,
    required this.svg,
    required this.text,
    required this.onPressed

}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width:420.w,
      height: 64.sp,

      decoration: BoxDecoration(
        color: lightGrey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 32.sp,
              child: SvgPicture.asset(svg),
            ),
            SizedBox(
              width:32.w ,
            ),

            Text(
                text,
                style:CustomTextStyle.style400.copyWith(fontSize: 28.sp,color: Colors.white24)
            ),
          ],
        ),
      ),
    );
  }
}
