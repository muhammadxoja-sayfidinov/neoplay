import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/style.dart';

import '../../../data/models/models.dart';
import '../../widgets/horizontal_movie_card.dart';
import '../../widgets/tips_carousel.dart';
import '../../widgets/vertical_movie_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  int _focusedIndex = 0;

  final ScrollController _scrollController = ScrollController();
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          _scrollToIndex(i);
        }
      });
    }
  }

  void _scrollToIndex(int index) {
    final position = index * 320.0; // Har bir elementning balandligi
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    int currentPage = 0;
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowRight): const NextFocusIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowLeft):
            const PreviousFocusIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          NextFocusIntent: CallbackAction<NextFocusIntent>(
            onInvoke: (intent) => _moveFocus(1),
          ),
          PreviousFocusIntent: CallbackAction<PreviousFocusIntent>(
            onInvoke: (intent) => _moveFocus(-1),
          ),
        },
        child: SingleChildScrollView(
          child: FocusScope(
            node: _focusScopeNode,
            child: Column(
              children: [
                SizedBox(
                  height: 798.h,
                  child: Expanded(
                    child: TipsCarousel(
                      pageController: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Avval ko’rilganlar',
                      style: CustomTextStyle.style600.copyWith(fontSize: 36.sp),
                    ),
                    24.verticalSpace,
                    SizedBox(
                      height: 293.sp,
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
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
                              child: HorizontalMovieCard(
                                focusedIndex: _focusedIndex,
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    70.verticalSpace,
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yangi filmlar',
                      style: CustomTextStyle.style600.copyWith(fontSize: 36.sp),
                    ),
                    24.verticalSpace,
                    SizedBox(
                      height: 367.sp,
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
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
                    70.verticalSpace,
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seriallar',
                      style: CustomTextStyle.style600.copyWith(fontSize: 36.sp),
                    ),
                    24.verticalSpace,
                    SizedBox(
                      height: 367.sp,
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
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
                    70.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
