import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';

import '../../../data/models/models.dart';
import '../../widgets/vertical_movie_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> with SingleTickerProviderStateMixin {
  bool filter = true;
  bool typeFilterVisible = false;
  String selectedFilter = '';

  AnimationController? _controller;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller!, curve: Curves.easeInOut));
  }

  void toggleFilter() {
    setState(() {
      filter = !filter;
    });
  }

  void showTypeFilter(String filterType) {
    setState(() {
      selectedFilter = filterType;
      typeFilterVisible = !typeFilterVisible;
      if (typeFilterVisible) {
        _controller!.forward();
      } else {
        _controller!.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              filter
                  ? GestureDetector(
                onTap: toggleFilter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  decoration: BoxDecoration(
                    color: GilosNeutral800,
                    border: Border.all(
                      width: 2,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.r),
                      bottomRight: Radius.circular(60.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Saralash",
                        style: CustomTextStyle.style400.copyWith(
                          fontSize: 28.sp,
                          color: Colors.white,
                        ),
                      ),
                      32.horizontalSpace,
                      SvgPicture.asset(
                        "assets/images/Up.svg",
                        width: 22.w,
                      ),
                    ],
                  ),
                ),
              )
                  : Row(
                children: [
                  catalogFilter("Ovoz tili"),
                  catalogFilter("Janr"),
                  catalogFilter("Davlati"),
                  catalogFilter("Chiqqan yili"),
                  catalogFilter("Saralash"),
                ],
              ),
              24.verticalSpace,
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 48.sp, vertical: 32.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.r),
                    color: GilosNeutral800,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Filimlar",
                        style: CustomTextStyle.style600.copyWith(
                          color: Colors.white,
                          fontSize: 38.sp,
                        ),
                      ),
                      32.sp.verticalSpace,
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            childAspectRatio: 0.59,
                          ),
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return Focus(
                              onFocusChange: (hasFocus) {},
                              child: InkWell(
                                child: VerticalMovieCard(
                                  focusedIndex: 0,
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
              ),
            ],
          ),
          // Filter Side Panel
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: typeFilterVisible ? 0 : -400.w, // Filter panel width should be 400.w
            top: 0,
            bottom: 0,
            child: SlideTransition(
              position: _slideAnimation!,
              child: Container(
                width: 400.w,
                decoration: BoxDecoration(
                  color: GilosNeutral800,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48.r),
                    bottomLeft: Radius.circular(48.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$selectedFilter bo'yicha saralash",
                        style: CustomTextStyle.style600.copyWith(
                          fontSize: 28.sp,
                          color: Colors.white,
                        ),
                      ),
                      24.verticalSpace,
                      if (selectedFilter == "Janr") ...[
                        genreFilterOption("Barchasi", true),
                        genreFilterOption("Olaviy", false),
                        genreFilterOption("Jangari", false),
                        genreFilterOption("Detektiv", false),
                        genreFilterOption("Multfilm", false),
                      ] else if (selectedFilter == "Ovoz tili") ...[
                        genreFilterOption("Barchasi", true),
                        genreFilterOption("O'zbekcha", false),
                        genreFilterOption("Ruscha", false),
                        genreFilterOption("Inglizcha", false),
                      ] else if (selectedFilter == "Davlati") ...[
                        genreFilterOption("Barchasi", true),
                        genreFilterOption("AQSh", false),
                        genreFilterOption("Fransiya", false),
                        genreFilterOption("Rossiya", false),
                      ] else if (selectedFilter == "Chiqqan yili") ...[
                        genreFilterOption("Barchasi", true),
                        genreFilterOption("2023", false),
                        genreFilterOption("2022", false),
                        genreFilterOption("2021", false),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget catalogFilter(String filterType) {
    return GestureDetector(
      onTap: () {
        showTypeFilter(filterType);
      },
      child: Container(
        margin: EdgeInsets.only(right: 24.w),
        width: 195.w,
        padding: EdgeInsets.symmetric(vertical: 17.5.h, horizontal: 19.w),
        decoration: BoxDecoration(
          color: GilosNeutral800,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            width: 2.w,
            color: Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              filterType,
              style: CustomTextStyle.style500.copyWith(fontSize: 16.sp, color: Colors.white),
            ),
            SvgPicture.asset(
              "assets/images/Down.svg",
              width: 12.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget genreFilterOption(String genre, bool isSelected) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 32.w),
      decoration: BoxDecoration(
        color: isSelected  ? Colors.red.shade600 : Colors.transparent,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            genre,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check,
              color: red,
              size: 24.sp,
            ),
        ],
      ),
    );
  }
}
