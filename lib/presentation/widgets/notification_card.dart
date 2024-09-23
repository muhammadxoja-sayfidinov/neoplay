import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/data/models/notification.dart';

class NotificationCard extends StatelessWidget {
  final int _focusedIndex;
  final int index;
  final VoidCallback onPressed;

  const NotificationCard({
    super.key,
    required int focusedIndex,
    required this.index,
    required this.onPressed,
  }) : _focusedIndex = focusedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.1.sp),
      width: 758.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: GilosNeutral900,
        borderRadius: BorderRadius.circular(36.2.r),
        border: Border.all(
          color: _focusedIndex == index ? Colors.red : Colors.transparent,
          width: 4.53.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container with proper constraints
          Container(
            padding: EdgeInsets.all(11.43.sp),
            width: 228.53.w,
            height: 342.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.36.r),
              border: Border.all(
                color: grey,
                width: 2.26.w,
              ),
              image: DecorationImage(
                image: AssetImage(notification[index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: 83.w,
              height: 38.h,
              padding: EdgeInsets.all(4.54.sp),
              decoration: BoxDecoration(
                color: Colors.grey[20],
                borderRadius: BorderRadius.circular(22.85.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/images/star_notification.svg",
                    width: 21.73.w,
                  ),
                  7.62.horizontalSpace,
                  Text(
                    notification[index].movieRating.toString(),
                    style: CustomTextStyle.style400
                        .copyWith(fontSize: 22.85.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          27.15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification[index].title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: CustomTextStyle.style600
                      .copyWith(fontSize: 36.sp, color: Colors.white),
                ),
                42.verticalSpace,
                Text(
                  notification[index].description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: CustomTextStyle.style400
                      .copyWith(fontSize: 24.sp, color: Colors.white),
                ),
                42.verticalSpace,
                Container(
                  width: double.infinity,
                  height: 64.h,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.2.r),
                    color: red,
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: onPressed,
                      child: Text(
                        "Batafsil o’qish",
                        style: CustomTextStyle.style400
                            .copyWith(fontSize: 28.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
