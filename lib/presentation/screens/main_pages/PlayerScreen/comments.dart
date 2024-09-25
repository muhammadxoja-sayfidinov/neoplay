import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/style.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

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
            'Fikrlar va baholar',
            style: CustomTextStyle.style600.copyWith(
              fontSize: 38.sp,
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(20.sp),
                    padding: EdgeInsets.all(32.sp),
                    width: 790.w,
                    height: 296.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: GilosNeutral700),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Container(
                              width: 108.w,
                              height: 108.w,
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/film_images/actor2.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0.r)),
                              ),
                            ),
                            32.horizontalSpace,
                            Text(
                              'Saidalixon Sobirov',
                              style: CustomTextStyle.style600
                                  .copyWith(fontSize: 32.sp),
                            )
                          ],
                        ),
                        16.verticalSpace,
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment(1.5, 1),
                              children: [
                                Image.asset(
                                  'assets/rating/star.png',
                                  width: 75.w,
                                ),
                                Image.asset(
                                  'assets/rating/3.png',
                                  width: 40.w,
                                ),
                              ],
                            ),
                            60.horizontalSpace,
                            Expanded(
                              child: Text(
                                'Film ssenariysi o’zgacha edi. Aktyorlar mahorat bilan rollarga hissiyot bilan yondalashishgan, qisqa qilganda detektiv janridagi yaxshi filmlardan!',
                                style: CustomTextStyle.style400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
