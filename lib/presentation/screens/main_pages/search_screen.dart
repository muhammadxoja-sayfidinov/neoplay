import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import '../../widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode searchFieldFocusNode = FocusNode();
  final FocusNode gridFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchFieldFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Focus(
          focusNode: searchFieldFocusNode,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 600.w),
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.r),
                bottomRight: Radius.circular(60.r),
              ),
            ),
            child: Center(
              child: TextField(
                controller: _searchController,
                style: CustomTextStyle.style400.copyWith(
                  fontSize: 24.sp,
                  color: gilosNeutralWhite,
                ),
                decoration: InputDecoration(
                  icon: Container(
                    width: 36.w,
                    child: SvgPicture.asset("assets/images/search_logo.svg"),
                  ),
                  hintText: "Film, serial, multfilm izlang",
                  hintStyle: CustomTextStyle.style400.copyWith(
                    fontSize: 24.sp,
                    color: gilosNeutral,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) {
                  // Move focus to the grid when search is submitted
                  gridFocusNode.requestFocus();
                },
              ),
            ),
          ),
        ),

        32.h.verticalSpace,

        // Search Results
        Expanded(
          child: Container()
        ),
      ],
    );
  }
}
