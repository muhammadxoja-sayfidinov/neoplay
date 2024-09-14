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
  int _previousOnesIndex = 0;
  int _newFilmsIndex = 0;
  int _seriesIndex = 0;
  int currentPage = 1;
  final pageController = PageController();

  final ScrollController _verticalScrollController = ScrollController(); // Vertical scroll controller
  final ScrollController _previousScrollController = ScrollController(); // Separate for each section
  final ScrollController _newFilmsScrollController = ScrollController();
  final ScrollController _seriesScrollController = ScrollController();

  final List<FocusNode> _previousOnes = List<FocusNode>.generate(movies.length, (_) => FocusNode());
  final List<FocusNode> _newFilms = List<FocusNode>.generate(movies.length, (_) => FocusNode());
  final List<FocusNode>  _series= List<FocusNode>.generate(movies.length, (_) => FocusNode());
  final FocusNode tipsFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    tipsFocus.requestFocus();
  }

  void _scrollToIndex(ScrollController controller, int index , double size ) {
    final position = (index - 1) * size.w;
    controller.animateTo(
      position,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollVertically(double offset) {
    _verticalScrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    _previousScrollController.dispose();
    _newFilmsScrollController.dispose();
    _seriesScrollController.dispose();

    for (var node in _previousOnes) {
      node.dispose();
    }
    for (var node in _newFilms) {
      node.dispose();
    }
    for (var node in _series) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      LogicalKeyboardKey key = event.logicalKey;

      if (key == LogicalKeyboardKey.arrowRight) {
        if (tipsFocus.hasFocus) {
          setState(() {
            if (currentPage < 3 - 1) {
              currentPage = currentPage + 1;
              pageController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            }
          });
        } else if (_previousOnes[_previousOnesIndex].hasFocus) {
          _moveFocus(_previousOnesIndex, 1, _previousOnes, _previousScrollController,451.0);
        } else if (_newFilms[_newFilmsIndex].hasFocus) {
          _moveFocus(_newFilmsIndex, 1, _newFilms, _newFilmsScrollController,227.0);
        } else if (_series[_seriesIndex].hasFocus) {
          _moveFocus(_seriesIndex, 1, _series, _seriesScrollController,227.0);
        }
      } else if (key == LogicalKeyboardKey.arrowLeft) {
        if (tipsFocus.hasFocus) {
          setState(() {
            if (currentPage > 0) {
              currentPage = currentPage - 1;
              pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            }
          });
        } else if (_previousOnes[_previousOnesIndex].hasFocus) {
          _moveFocus(_previousOnesIndex, -1, _previousOnes, _previousScrollController , 451.0);
        } else if (_newFilms[_newFilmsIndex].hasFocus) {
          _moveFocus(_newFilmsIndex, -1, _newFilms, _newFilmsScrollController , 227.0);
        } else if (_series[_seriesIndex].hasFocus) {
          _moveFocus(_seriesIndex, -1, _series, _seriesScrollController,227.0);
        }
      } else if (key == LogicalKeyboardKey.arrowDown) {
        if (tipsFocus.hasFocus) {
          _scrollVertically(400.sp); // Scroll down to "Avval ko'rilganlar"
          _previousOnes[_previousOnesIndex].requestFocus();
        } else if (_previousOnes[_previousOnesIndex].hasFocus) {
          _scrollVertically(700.sp); // Scroll down to "Yangi filmlar"
          _newFilms[_newFilmsIndex].requestFocus();
        } else if (_newFilms[_newFilmsIndex].hasFocus) {
          _scrollVertically(900.sp); // Scroll down to "Seriallar"
          _series[_seriesIndex].requestFocus();
        }
      } else if (key == LogicalKeyboardKey.arrowUp) {
        if (_series[_seriesIndex].hasFocus) {
          _scrollVertically(700.sp); // Scroll up to "Yangi filmlar"
          _newFilms[_newFilmsIndex].requestFocus();
        } else if (_newFilms[_newFilmsIndex].hasFocus) {
          _scrollVertically(400.sp); // Scroll up to "Avval ko'rilganlar"
          _previousOnes[_previousOnesIndex].requestFocus();
        } else if (_previousOnes[_previousOnesIndex].hasFocus) {
          _scrollVertically(0); // Scroll up to the tips section
          tipsFocus.requestFocus();
        }
      }
    }
  }

  void _moveFocus(int _focusedIndex, int direction, List<FocusNode> focusNodes, ScrollController scrollController ,double size) {
    int newIndex = _focusedIndex + direction;

    if (newIndex < 0) {
      FocusScope.of(context).previousFocus();
    } else if (newIndex < movies.length) {
      setState(() {
        _focusedIndex = newIndex;
        focusNodes[newIndex].requestFocus();
        _scrollToIndex(scrollController, newIndex , size);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: _handleKeyEvent,
      child: SingleChildScrollView(
        controller: _verticalScrollController, // Enable vertical scrolling
        child: FocusScope(
          node: _focusScopeNode,
          child: Column(
            children: [
              SizedBox(
                height: 798.h,
                child: TipsCarousel(
                  tipsFocus: tipsFocus,
                  pageController: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
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
                      controller: _previousScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return Focus(
                          focusNode: _previousOnes[index],
                          onFocusChange: (hasFocus) {
                            setState(() {
                              if (hasFocus) _previousOnesIndex = index;
                            });
                          },
                          child: InkWell(
                            onTap: () {
                              _previousOnes[index].requestFocus();
                            },
                            child: HorizontalMovieCard(
                              focusedIndex: _previousOnesIndex,
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
                      controller: _newFilmsScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return Focus(
                          focusNode: _newFilms[index],
                          onFocusChange: (hasFocus) {
                            setState(() {
                              if (hasFocus) _newFilmsIndex = index;
                            });
                          },
                          child: InkWell(
                            onTap: () {
                              _newFilms[index].requestFocus();
                            },
                            child: VerticalMovieCard(
                              focusedIndex: _newFilmsIndex,
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
                      controller: _seriesScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return Focus(
                          focusNode: _series[index],
                          onFocusChange: (hasFocus) {
                            setState(() {
                              if (hasFocus) _seriesIndex = index;
                            });
                          },
                          child: InkWell(
                            onTap: () {
                              _series[index].requestFocus();
                            },
                            child: VerticalMovieCard(
                              focusedIndex: _seriesIndex,
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
    );
  }
}
