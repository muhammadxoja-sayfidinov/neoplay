import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/data/models/notification.dart';

class NotificationCard extends StatelessWidget {
  final int _focusedIndex;
  final int index;
  const NotificationCard({
    super.key,
    required int focusedIndex,
    required this.index,

  }):_focusedIndex = focusedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.1.sp),
      width:notification.length ==1  ? 758.w:double.infinity,
      height: 379.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.2.r),
        border: Border.all(
          color: _focusedIndex == index ? Colors.red : Colors.transparent,
          width: 4.53.w,
        ),
      ),

      child: Row(
        children: [
          Container(

          ),
        ],
      ),
    );
  }
}
