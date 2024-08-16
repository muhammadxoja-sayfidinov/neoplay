import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neoplay/core/constants/style.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;

  final double imdbRating;
  final double kinopoiskRating;
  final double neoPlayRating;

  const MovieCard({
    Key? key,
    required this.imageUrl,
    required this.imdbRating,
    required this.kinopoiskRating,
    required this.neoPlayRating,
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
                width: 236,
                height: 329,
                fit: BoxFit.cover,
              ),
            ),
            // Reytinglar
            Positioned(
              top: 8,
              left: 8,
              child: Row(
                children: [
                  _buildRatingBadge('assets/images/logo_imdb.svg', imdbRating, Colors.yellow),
                  SizedBox(width: 4),
                  _buildRatingBadge('assets/images/logo_poisk.svg', kinopoiskRating, Colors.orange),
                  SizedBox(width: 4),
                  _buildRatingBadge('assets/images/logo_neoplay.svg', neoPlayRating, Colors.red),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }

  Widget _buildRatingBadge(String source, double rating, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(source),
          SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: CustomTextStyle.style600.copyWith(color: Colors.red)
          ),
        ],
      ),
    );
  }
}
