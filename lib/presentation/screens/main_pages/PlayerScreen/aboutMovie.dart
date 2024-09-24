import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/style.dart';

class AboutMovie extends StatelessWidget {
  const AboutMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(48.sp),
      width: 1700.sp,
      height: 772.w,
      decoration: BoxDecoration(
        color: GilosNeutral800,
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Film haqida',
            style: CustomTextStyle.style600.copyWith(
              fontSize: 38.sp,
            ),
          ),
          32.verticalSpace,
          SizedBox(
            width: 1640.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/film_images/film4.png',
                  width: 386.w,
                ),
                32.horizontalSpace,
                SizedBox(
                  width: 1100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Koperatsiya: Maxfiy hamkorlik filmi',
                        style: CustomTextStyle.style500
                            .copyWith(color: Colors.white),
                      ),
                      24.verticalSpace,
                      Text(
                        '''Shimoliy Koreya chegara qo‘shinlari polkovnigi Cha Gi Sung armiyaga kontrabanda qurollarini yetkazib berish bilan shug‘ullangan, biroq kunlarning birida vaziyatdan unumli foydalanishga qaror qilgan va chegaradan ham narkotik moddalarni olib o‘ta boshlagan. U bu bilan qo'lga olindi, lavozimi tushirildi, barcha regaliyalardan mahrum bo'ldi...''',
                        style: CustomTextStyle.style400,
                      ),
                      48.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Davlati:',
                                style: CustomTextStyle.style400.copyWith(),
                              ),
                              16.verticalSpace,
                              Text(
                                'Janubiy Koreya',
                                style: CustomTextStyle.style400.copyWith(
                                  backgroundColor: Colors.grey[800],
                                ),
                              ),
                              8.verticalSpace,
                              Text(
                                'Janubiy Koreya',
                                style: CustomTextStyle.style400.copyWith(
                                  backgroundColor: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                          48.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ishlab chiqilgan yili:',
                                style: CustomTextStyle.style400.copyWith(),
                              ),
                              16.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    '2018',
                                    style: CustomTextStyle.style400.copyWith(
                                      backgroundColor: Colors.grey[800],
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    '2019',
                                    style: CustomTextStyle.style400.copyWith(
                                      backgroundColor: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          48.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Davomiyligi:',
                                style: CustomTextStyle.style400.copyWith(),
                              ),
                              16.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    '180 daqiqa',
                                    style: CustomTextStyle.style400.copyWith(
                                      backgroundColor: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          48.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Film janri:',
                                style: CustomTextStyle.style400.copyWith(),
                              ),
                              16.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    'Detektiv',
                                    style: CustomTextStyle.style400.copyWith(
                                      backgroundColor: Colors.grey[800],
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    'Jangari',
                                    style: CustomTextStyle.style400.copyWith(
                                      backgroundColor: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          48.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yosh chegarasi:',
                                style: CustomTextStyle.style400.copyWith(),
                              ),
                              16.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    '18+',
                                    style: CustomTextStyle.style400.copyWith(
                                      backgroundColor: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      48.verticalSpace,
                      Text(
                        'Platformalarda quyidagicha baholangan:',
                        style: CustomTextStyle.style400,
                      ),
                      16.verticalSpace,
                      Row(
                        children: [
                          Wrap(
                            children: [
                              _ratingWidget('assets/images/logo_imdb.svg', 7.2,
                                  yellow, 37.w, 22.h, 105.w, 40.h),
                              5.horizontalSpace,
                              _ratingWidget('assets/images/kino poisk icon.svg',
                                  9.2, errorColor, 40.w, 24.h, 94.w, 40.h),
                              5.horizontalSpace,
                              _ratingWidget('assets/images/logo_neoplay.svg',
                                  8.8, red, 72.w, 22.h, 128.w, 40.h),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _ratingWidget(
  String logoPath,
  double rating,
  Color color,
  double imgWidth,
  double imgHeight,
  double boxWidth,
  double boxHeight,
) {
  return Container(
    width: boxWidth,
    height: boxHeight,
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      children: [
        SizedBox(
            width: imgWidth,
            height: imgHeight,
            child: SvgPicture.asset(
              logoPath,
            )),
        SizedBox(width: 10.w),
        Text(rating.toString(),
            style: CustomTextStyle.style400.copyWith(fontSize: 19.sp)),
      ],
    ),
  );
}
