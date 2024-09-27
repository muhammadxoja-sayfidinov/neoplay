import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/style.dart';

class SettingDevices extends StatefulWidget {
  const SettingDevices({super.key});

  @override
  State<SettingDevices> createState() => _SettingDevicesState();
}

class _SettingDevicesState extends State<SettingDevices> {
  bool isActive = false;
  bool unistal = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: unistal
            ? Container(
                width: 860.w,
                height: 530.h,
                padding: EdgeInsets.all(48.sp),
                decoration: BoxDecoration(
                  color: GilosNeutral800,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Qurilmalar",
                      style: CustomTextStyle.style600
                          .copyWith(fontSize: 40.sp, color: Colors.white),
                    ),
                    32.verticalSpace,
                    Row(
                      children: [
                        Text(
                          "Seanslar",
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp, color: gilosNeutral),
                        ),
                        180.horizontalSpace,
                        Text(
                          "Sana va vaqti:",
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp, color: gilosNeutral),
                        ),
                        100.horizontalSpace,
                        Text(
                          "Qurilmani chiqarishs",
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp, color: gilosNeutral),
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    Devices("WebSite Chrome,\nWindows 10, Desktop",
                        "22-fev. 2024, 23:09", () {
                      setState(() {
                        unistal = false;
                      });
                    }, isActive = true),
                    Divider(
                      color: gilosNeutral400,
                      height: 0.5.h,
                    ),
                    Devices(
                        "iPhone 14                   ", "22-fev. 2024, 23:09",
                        () {
                      setState(() {
                        unistal = false;
                      });
                    }, isActive = false),
                    Divider(
                      color: gilosNeutral400,
                      height: 0.5.h,
                    ),
                    Devices("WebSite Chrome,\nWindows 10, Desktop",
                        "22-fev. 2024, 23:09", () {
                      setState(() {
                        unistal = false;
                      });
                    }, isActive = false),
                    Divider(
                      color: gilosNeutral400,
                      height: 0.5.h,
                    ),
                    32.verticalSpace,
                    CustomButton(
                        color: gilosNeutral600,
                        width: double.infinity,
                        name: "Barchasini yakunlash",
                        onPressed: () {
                          setState(() {
                            unistal = false;
                          });
                        })
                  ],
                ),
              )
            : Container(
                width: 666.w,
                height: 310.h,
                padding: EdgeInsets.all(48.sp),
                decoration: BoxDecoration(
                  color: GilosNeutral800,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Rostdan ham ushbu:",
                      style: CustomTextStyle.style600
                          .copyWith(fontSize: 38.sp, color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: '“WebSite\nChrome, Windows 10, Desktopn"\n',
                          style: CustomTextStyle.style600.copyWith(
                            fontSize: 38.sp,
                            color: errrorcolorV2,
                          ),
                        ),
                        TextSpan(
                          text: "seansni chiqarib\nyubormoqchimisiz?",
                          style: CustomTextStyle.style600
                              .copyWith(fontSize: 38.sp, color: Colors.white),
                        )
                      ],
                    )),
                    32.verticalSpace,
                    Row(
                      children: [
                        CustomButton(
                            color: errrorcolorV2,
                            width: 310.w,
                            name: "Chiqarib yuborish",
                            onPressed: () {
                              setState(() {
                                unistal = true;
                              });
                            }),
                        12.horizontalSpace,
                        CustomButton(
                            color: gilosNeutral600,
                            width: 248.w,
                            name: "Bekor qilish",
                            onPressed: () {
                              setState(() {
                                unistal = true;
                              });
                            })
                      ],
                    )
                  ],
                ),
              ));
  }
}

Widget Devices(
    String Seanslar, String time, VoidCallback onTap, bool isActive) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Seanslar,
          style: CustomTextStyle.style400
              .copyWith(fontSize: 24.sp, color: Colors.white),
        ),
        Text(
          time,
          style: CustomTextStyle.style400
              .copyWith(fontSize: 24.sp, color: Colors.white),
        ),
        CustomButton(
            color: isActive ? errrorcolorV2 : gilosNeutral600,
            width: 233.w,
            name: "Yakunlash",
            onPressed: onTap)
      ],
    ),
  );
}
