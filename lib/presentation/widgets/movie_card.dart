import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neoplay/core/constants/style.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            // Reytinglar
            Positioned(
              top: 8,
              left: 8,
              child: Wrap(
                children: [
                  _buildRatingBadge('assets/images/logo_imdb.svg', imdbRating,
                      Colors.yellow, 23.w, 14.h),
                  SizedBox(width: 4),
                  _buildRatingBadge('assets/images/logo_poisk.svg',
                      kinopoiskRating, Colors.orange, 21.w, 14.h),
                  SizedBox(width: 4),
                  _buildRatingBadge('assets/images/logo_neoplay.svg',
                      neoPlayRating, Colors.red, 43.w, 14.h),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBadge(String source, double rating, Color color,
      double imgWidth, double imgHeight) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        children: [
          SvgPicture.asset(
            source,
            width: imgWidth,
            height: imgHeight,
          ),
          SizedBox(width: 4.w),
          Text(rating.toStringAsFixed(1),
              style: CustomTextStyle.style400
                  .copyWith(color: Colors.white, fontSize: 12.sp)),
        ],
      ),
    );
  }
}
