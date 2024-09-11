import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/colors.dart';

class TipsCarousel extends StatefulWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const TipsCarousel(
      {super.key, required this.pageController, required this.onPageChanged});

  @override
  _TipsCarouselState createState() => _TipsCarouselState();
}

class _TipsCarouselState extends State<TipsCarousel> {
  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      widget.onPageChanged(widget.pageController.page!.round());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 1640.w,
              height: 700.h,
              child: Expanded(
                child: PageView(
                  controller: widget.pageController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 48.h, horizontal: 70.w),
                        width: 1640.w,
                        height: 798.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.r),
                          image: const DecorationImage(
                            image: ExactAssetImage(
                                'assets/film_images/treler.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                _buildRatingBadge('assets/images/logo_imdb.svg',
                                    7.2, yellow, 37.w, 22.h, 105.w, 40.h),
                                5.horizontalSpace,
                                _buildRatingBadge('assets/images/img.svg', 9.2,
                                    errorColor, 40.w, 24.h, 94.w, 40.h),
                                5.horizontalSpace,
                                _buildRatingBadge(
                                    'assets/images/logo_neoplay.svg',
                                    8.8,
                                    red,
                                    72.w,
                                    22.h,
                                    128.w,
                                    40.h),
                              ],
                            ),
                            84.verticalSpace,
                            Text(
                              'Cчастье',
                              style: CustomTextStyle.style600,
                            ),
                            32.verticalSpace,
                            Text(
                              'Shimoliy Koreya chegara qo‘shinlari polkovnigi\nCha Gi Sung armiyaga kontrabanda qurollarini\nyetkazib berish bilan shug‘ullangan, biroq \nkunlarning birida vaziyatdan...',
                              style: CustomTextStyle.style500.copyWith(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                  height: 3.sp),
                            ),
                            32.verticalSpace,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.sp, horizontal: 32.w),
                              width: 266.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: red,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/play.svg',
                                    width: 24.w,
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    'Tomosha qilish',
                                    style: CustomTextStyle.style500.copyWith(
                                        color: Colors.white, fontSize: 20.sp),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 48.h, horizontal: 70.w),
                        width: 1640.w,
                        height: 798.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.r),
                          image: const DecorationImage(
                            image: ExactAssetImage(
                                'assets/film_images/treler.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                _buildRatingBadge('assets/images/logo_imdb.svg',
                                    7.2, yellow, 37.w, 22.h, 105.w, 40.h),
                                5.horizontalSpace,
                                _buildRatingBadge('assets/images/img.svg', 9.2,
                                    errorColor, 40.w, 24.h, 94.w, 40.h),
                                5.horizontalSpace,
                                _buildRatingBadge(
                                    'assets/images/logo_neoplay.svg',
                                    8.8,
                                    red,
                                    72.w,
                                    22.h,
                                    128.w,
                                    40.h),
                              ],
                            ),
                            84.verticalSpace,
                            Text(
                              'Cчастье',
                              style: CustomTextStyle.style600,
                            ),
                            32.verticalSpace,
                            Text(
                              'Shimoliy Koreya chegara qo‘shinlari polkovnigi\nCha Gi Sung armiyaga kontrabanda qurollarini\nyetkazib berish bilan shug‘ullangan, biroq \nkunlarning birida vaziyatdan...',
                              style: CustomTextStyle.style500.copyWith(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                  height: 3.sp),
                            ),
                            32.verticalSpace,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.sp, horizontal: 32.w),
                              width: 266.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: red,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/play.svg',
                                    width: 24.w,
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    'Tomosha qilish',
                                    style: CustomTextStyle.style500.copyWith(
                                        color: Colors.white, fontSize: 20.sp),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 48.h, horizontal: 70.w),
                        width: 1640.w,
                        height: 798.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.r),
                          image: const DecorationImage(
                            image: ExactAssetImage(
                                'assets/film_images/treler.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                _buildRatingBadge('assets/images/logo_imdb.svg',
                                    7.2, yellow, 37.w, 22.h, 105.w, 40.h),
                                5.horizontalSpace,
                                _buildRatingBadge('assets/images/img.svg', 9.2,
                                    errorColor, 40.w, 24.h, 94.w, 40.h),
                                5.horizontalSpace,
                                _buildRatingBadge(
                                    'assets/images/logo_neoplay.svg',
                                    8.8,
                                    red,
                                    72.w,
                                    22.h,
                                    128.w,
                                    40.h),
                              ],
                            ),
                            84.verticalSpace,
                            Text(
                              'Cчастье',
                              style: CustomTextStyle.style600,
                            ),
                            32.verticalSpace,
                            Text(
                              'Shimoliy Koreya chegara qo‘shinlari polkovnigi\nCha Gi Sung armiyaga kontrabanda qurollarini\nyetkazib berish bilan shug‘ullangan, biroq \nkunlarning birida vaziyatdan...',
                              style: CustomTextStyle.style500.copyWith(
                                  color: Colors.white,
                                  fontSize: 28.sp,
                                  height: 3.sp),
                            ),
                            32.verticalSpace,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.sp, horizontal: 32.w),
                              width: 266.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: red,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/play.svg',
                                    width: 24.w,
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    'Tomosha qilish',
                                    style: CustomTextStyle.style500.copyWith(
                                        color: Colors.white, fontSize: 20.sp),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 70.w,
              bottom: 60.h,
              child: SmoothPageIndicator(
                controller: widget.pageController,
                count: 3,
                effect: WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBadge(
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
}
