import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackground extends StatelessWidget {
  final Widget widget;

  const CustomBackground({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Log_in.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 87.sp, horizontal: 120.sp),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.0),
                ],
              ),
            ),
            child: widget));
  }
}
