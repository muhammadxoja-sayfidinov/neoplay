import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/style.dart';
import '../../../../data/models/models.dart';
import '../../../widgets/vertical_movie_card.dart';

class SimilarMovies extends StatefulWidget {
  SimilarMovies({super.key});

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  int _focusedIndex = 0;

  final ScrollController _newFilmsScrollController = ScrollController();

  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(movies.length, (_) => FocusNode());

  void _scrollToIndex(int index) {
    int itemsPerRow = 6;
    double itemHeight = 630.0 / (itemsPerRow);
    int row = index ~/ itemsPerRow;
    double position = row * itemHeight;
    _newFilmsScrollController.animateTo(
      position,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
            'Yangi filmlar',
            style: CustomTextStyle.style600.copyWith(fontSize: 36.sp),
          ),
          24.verticalSpace,
          SizedBox(
            height: 630.h,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _newFilmsScrollController,
              scrollDirection: Axis.vertical,
              child: GridView.builder(
                shrinkWrap: true,
                // Make GridView shrink to fit its content
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 0.59,
                ),
                itemCount: movies.length,
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
                        _scrollToIndex(index);
                      },
                      child: VerticalMovieCard(
                        focusedIndex: _focusedIndex,
                        index: index,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          70.verticalSpace,
        ],
      ),
    );
  }
}
