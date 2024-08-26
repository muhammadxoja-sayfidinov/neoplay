import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/widgets/movie_card.dart';

import '../../../core/constants/style.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Avval ko’rilganlar',
//             style: CustomTextStyle.style600.copyWith(fontSize: 36.sp),
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 height: 290.h,
//                 width: 836,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 6,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         padding: EdgeInsets.only(left: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25.r),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Wrap(
//                               children: [
//                                 SizedBox(
//                                   width: 451.w,
//                                   height: 255.h,
//                                   child: MovieCard(
//                                       height: 255.h,
//                                       width: 451.h,
//                                       imageUrl:
//                                           'https://wp-s.ru/wallpapers/7/0/470920498858434/kollin-farrel-i-kejt-bekinsejl.jpg',
//                                       imdbRating: 7.3,
//                                       kinopoiskRating: 11.1,
//                                       neoPlayRating: 2.3),
//                                 )
//                               ],
//                             ),
//                             12.verticalSpace,
//                             Text(
//                               'Koperatsiya maxfiy hamkorlik',
//                               style: CustomTextStyle.style600.copyWith(
//                                 fontSize: 19.sp,
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     }),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FocusNode _focusNode = FocusNode();
  int _focusedIndex = 0;

  final List<String> _movies = [
    'Kooperatsiya maxfiy hamkorlik',
    'Chiroqni o\'chiring',
    'Kooperatsiya maxfiy hamkorlik',
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      autofocus: true,
      node: FocusScopeNode(),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle tap (play movie, show details, etc.)
            },
            child: Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  _focusedIndex = hasFocus ? index : _focusedIndex;
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
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/kattalar.png', // Replace with actual image paths
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
          );
        },
      ),
    );
  }
}
