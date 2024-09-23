import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/data/models/notification.dart';
import 'package:neoplay/presentation/widgets/notification_card.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/style.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(notification.length, (_) => FocusNode());
  int _focusedIndex = 0;
  bool openNotif = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 70.h, bottom: 48.h, right: 85.w),
        padding: EdgeInsets.symmetric(horizontal: 48.sp, vertical: 32.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.r),
          color: GilosNeutral800,
        ),
        child: openNotif
            ? oneNotification(
                notification[_focusedIndex].title,
                notification[_focusedIndex].imageUrl,
                notification[_focusedIndex].description)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bildirishnomalar",
                    style: CustomTextStyle.style600.copyWith(
                      color: Colors.white,
                      fontSize: 38.sp,
                    ),
                  ),
                  32.sp.verticalSpace,
                  notification.isEmpty
                      ? SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(top: 145.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Bildirishnomalar mavjud emas",
                                  style: CustomTextStyle.style600
                                      .copyWith(fontSize: 66.sp),
                                ),
                                60.w.verticalSpace,
                                Image.asset(
                                  "assets/images/search_is_not.png",
                                  width: 245.w,
                                  height: 291.h,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // Specify the number of columns in the grid
                              mainAxisSpacing: 16,
                              // Specify the spacing between each item along the main axis
                              crossAxisSpacing: 16,
                              // Specify the spacing between each item along the cross axis
                              childAspectRatio:
                                  1.7, // Specify the aspect ratio of each item
                            ),
                            itemCount: notification.length,
                            itemBuilder: (context, index) {
                              return Focus(
                                focusNode: _focusNodes[index],
                                onFocusChange: (hasFocus) {
                                  setState(() {
                                    if (hasFocus) _focusedIndex = index;
                                  });
                                },
                                child: InkWell(
                                  onTap: () {
                                    _focusNodes[index].requestFocus();
                                  },
                                  child: NotificationCard(
                                    focusedIndex: _focusedIndex,
                                    onPressed: () {
                                      setState(() {
                                        openNotif = true;
                                      });
                                    },
                                    index: index,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}

Widget oneNotification(
  String title,
  String imageUrl,
  String description,
) {
  return Column(
    children: [
      Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: CustomTextStyle.style600
            .copyWith(fontSize: 38.sp, color: Colors.white),
      ),
      Row(
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
                image: AssetImage(imageUrl),
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
            ),
          ),
          27.15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
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
                      onPressed: () {},
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
    ],
  );
}
