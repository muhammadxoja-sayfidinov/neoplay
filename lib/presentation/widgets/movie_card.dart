import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final double imdbRating;
  final double kinopoiskRating;
  final double neoPlayRating;
  final double width;
  final double height;

  const MovieCard({
    Key? key,
    required this.imageUrl,
    required this.imdbRating,
    required this.kinopoiskRating,
    required this.neoPlayRating,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      // height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: AssetImage(imageUrl), // Changed to AssetImage for local images
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            left: 10.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildRatingBadge(
                  'assets/images/logo_imdb.svg',
                  imdbRating,
                  Colors.yellow,
                  39.sp,
                  14.sp,
                  77.sp,
                ),
                5.horizontalSpace,
                _buildRatingBadge(
                  'assets/images/logo_imdb.svg',
                  kinopoiskRating,
                  Colors.orange,
                  30.sp,
                  14.sp,
                  70.w,
                ),
                5.horizontalSpace,
                _buildRatingBadge(
                  'assets/images/logo_neoplay.svg',
                  neoPlayRating,
                  Colors.red,
                  43.w,
                  13.h,
                  92.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBadge(
      String logoPath,
      double rating,
      Color color,
      double imgWidth,
      double imgHeight,
      double boxWidth,
      ) {
    return Container(
      width: boxWidth,
      height: 30.sp,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            width: imgWidth.w,
            height: imgHeight.sp,
            child: SvgPicture.asset(
              logoPath,
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            rating.toString(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
