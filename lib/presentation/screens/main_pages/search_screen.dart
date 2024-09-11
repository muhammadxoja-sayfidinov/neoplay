import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/data/models/models.dart';
import 'package:neoplay/presentation/widgets/movie_card.dart';

import '../../widgets/vertical_movie_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode searchFieldFocusNode = FocusNode();
  final FocusNode gridFocusNode = FocusNode();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  int _focusedIndex = 0;

  final ScrollController _scrollController = ScrollController();
  final List<FocusNode> _focusNodes = List<FocusNode>.generate(movies.length, (_) => FocusNode());
  bool haveSearch = false;

  // Sample List of movies for the grid view
  final List<String> _movies = [
    'Kooperatsiya maxfiy hamkorlik',
    'Chiroqni o\'chiring',
    'Kooperatsiya maxfiy hamkorlik',
    'Kooperatsiya maxfiy hamkorlik',
    'Chiroqni o\'chiring',
    'Kooperatsiya maxfiy hamkorlik',
  ];

  void _scrollToIndex(int index) {
    final position = index * 320.0; // Height of each item
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    searchFieldFocusNode.requestFocus(); // Automatically focus on the search field
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      LogicalKeyboardKey key = event.logicalKey;

      if (key == LogicalKeyboardKey.arrowRight) {
        if (_focusNodes[_focusedIndex].hasFocus) {
          _moveFocus(1);
        }
      } else if (key == LogicalKeyboardKey.arrowDown) {
        if (searchFieldFocusNode.hasFocus) {
          setState(() {
            _focusNodes[_focusedIndex].requestFocus();
          });
        }
      } else if (key == LogicalKeyboardKey.arrowLeft) {
        if (_focusNodes[_focusedIndex].hasFocus && _focusedIndex != 0) {
          _moveFocus(-1);
        } else {
          FocusScope.of(context).previousFocus();
        }
      } else if (key == LogicalKeyboardKey.select) {
        // Implement selection logic here if needed
      } else if (key == LogicalKeyboardKey.enter) {
        FocusScope.of(context).nextFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      onKey: _handleKeyEvent,
      focusNode: FocusNode(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FocusScope(
          node: _focusScopeNode,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Search Bar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 600.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: searchFieldFocusNode.hasFocus ? 1 : 0,
                      color: searchFieldFocusNode.hasFocus ? red : grey,
                    ),
                    color: grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.r),
                      bottomRight: Radius.circular(60.r),
                    ),
                  ),
                  child: Center(
                    child: TextField(
                      focusNode: searchFieldFocusNode,
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
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) {
                        gridFocusNode.requestFocus(); // Move focus to grid
                      },
                    ),
                  ),
                ),
                32.h.verticalSpace,

                // Search Results
                Container(
                  width: double.infinity,
                  height: 1600.h,
                  padding: EdgeInsets.symmetric(horizontal: 48.sp, vertical: 32.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.r),
                    color: GilosNeutral800,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Izlash natijalari",
                        style: CustomTextStyle.style600.copyWith(
                          color: Colors.white,
                          fontSize: 38.sp,
                        ),
                      ),
                      32.sp.verticalSpace,
                      haveSearch
                          ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 145.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Bunday film\nmavjud emas",
                              style: CustomTextStyle.style600.copyWith(fontSize: 66.sp),
                            ),
                            60.w.horizontalSpace,
                            Image.asset(
                              "assets/images/search_is_not.png",
                              width: 245.w,
                              height: 291.h,
                            ),
                          ],
                        ),
                      )
                          : Container(
                        width: double.infinity,
                        height: 1200.h, // GridView height
                        child: GridView.builder(
                          controller: _scrollController,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            childAspectRatio: 0.7,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    searchFieldFocusNode.dispose();
    gridFocusNode.dispose();
    super.dispose();
  }

  void _moveFocus(int direction) {
    int newIndex = _focusedIndex + direction;

    if (newIndex < 0) {
      FocusScope.of(context).previousFocus();
    } else if (newIndex < movies.length) {
      setState(() {
        _focusedIndex = newIndex;
        _focusNodes[newIndex].requestFocus();
      });
    }
  }
}
