import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/style.dart';

class AboutActors extends StatefulWidget {
  AboutActors({super.key});

  @override
  State<AboutActors> createState() => _AboutActorsState();
}

class _AboutActorsState extends State<AboutActors> {
  final List<String> actorList = [
    'assets/film_images/actor1.png',
    'assets/film_images/actor2.png',
    'assets/film_images/actor3.png',
    'assets/film_images/actor4.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
    'assets/film_images/actor5.png',
  ];
  final ScrollController _actorsScrollController = ScrollController();

  final List<String> actorNameList = [
    'Yoo Hae-jin',
    'Hyeon Bin',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
    'Joo-hyeok',
  ];

  int currentIndex = 0;

  void _scrollToIndex(ScrollController controller, int index, double size) {
    final position = (index - 1) * size.w;
    controller.animateTo(
      position,
      duration: const Duration(milliseconds: 300),
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
              'Aktyorlar',
              style: CustomTextStyle.style600.copyWith(
                fontSize: 38.sp,
              ),
            ),
            32.verticalSpace,
            Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _actorsScrollController,
                  itemCount: actorList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        _scrollToIndex(_actorsScrollController, index, 350.w);
                        setState(() {});
                        currentIndex = index;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Column(
                          children: [
                            Container(
                              width: 146.w,
                              height: 146.w,
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: DecorationImage(
                                  image: AssetImage(actorList[index]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0.r)),
                                border: Border.all(
                                  color: currentIndex == index
                                      ? red
                                      : Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            12.verticalSpace,
                            Text(actorNameList[index],
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                    color: currentIndex == index
                                        ? red
                                        : Colors.white)),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            80.verticalSpace,
            Expanded(child: )
          ],
        ));
  }
}
