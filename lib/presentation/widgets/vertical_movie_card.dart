import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/style.dart';
import '../../data/models/models.dart';

class VerticalMovieCard extends StatelessWidget {
  const VerticalMovieCard({
    super.key,
    required int focusedIndex,
    required this.index,
  }) : _focusedIndex = focusedIndex;

  final int _focusedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 12.w, left: 5.w, right: 5.w),
          margin: EdgeInsets.only(right: 12.w),
          width: 227.sp,
          height: 307.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: _focusedIndex == index ? Colors.white : Colors.transparent,
              width: 3.w,
            ),
            image: DecorationImage(
              image: AssetImage(movies[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                        top: 5.w,
                        bottom: 3.w,
                      ),
                      width: 63.w,
                      height: 25.sp,
                      decoration: BoxDecoration(
                        color: gold,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/logo_imdb.svg',
                            width: 23.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            movies[index].imdbRating.toString(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  4.horizontalSpace,
                  Container(
                      padding: EdgeInsets.only(
                        top: 5.w,
                        bottom: 5.w,
                      ),
                      width: 63.w,
                      height: 25.sp,
                      decoration: BoxDecoration(
                        color: orange,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/kino poisk icon.svg',
                            width: 23.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            textAlign: TextAlign.right,
                            movies[index].kinopoiskRating.toString(),
                            style: CustomTextStyle.style400
                                .copyWith(fontSize: 12.sp),
                          ),
                        ],
                      )),
                  4.horizontalSpace,
                  Container(
                      padding: EdgeInsets.only(
                        top: 5.w,
                        bottom: 5.w,
                      ),
                      width: 77.w,
                      height: 25.sp,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/logo_neoplay.svg',
                            width: 46.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            textAlign: TextAlign.right,
                            movies[index].kinopoiskRating.toString(),
                            style: CustomTextStyle.style400
                                .copyWith(fontSize: 12.sp),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
        12.verticalSpace,
        SizedBox(
          width: 220.w,
          child: Text(
            movies[index].title,
            style: CustomTextStyle.style600.copyWith(
              fontSize: 19.sp,
            ),
          ),
        ),
      ],
    );
  }
}
