import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/tips_carousel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  int _focusedIndex = 0;

  final List<String> _movies = [
    'Kooperatsiya maxfiy hamkorlik',
    'Chiroqni o\'chiring',
    'Kooperatsiya maxfiy hamkorlik',
    'Kooperatsiya maxfiy hamkorlik',
    'Chiroqni o\'chiring',
    'Kooperatsiya maxfiy hamkorlik',
  ];

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
                SizedBox(
                  height: 353.h,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _movies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle tap (play movie, show details, etc.)
                        },
                        child: Focus(
                          focusNode: _focusNodes[index],
                          onFocusChange: (hasFocus) {
                            setState(() {
                              if (hasFocus) _focusedIndex = index;
                            });
                          },
                          child: Container(
                            width: 300,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: _focusedIndex == index
                                    ? Colors.orange
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                _focusNodes[index].requestFocus();
                                _scrollToIndex(index);
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/film_images/film6.png',
                                      // Replace with actual image paths
                                      width: 300,
                                      height: 170,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _movies[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }

  void _moveFocus(int direction) {
    int newIndex = _focusedIndex + direction;

    if (newIndex < 0) {
      FocusScope.of(context).previousFocus();
    } else if (newIndex < _movies.length) {
      setState(() {
        _focusedIndex = newIndex;
        _focusNodes[newIndex].requestFocus();
      });
    }
  }
}
