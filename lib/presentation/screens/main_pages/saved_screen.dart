import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/style.dart';

import '../../../core/constants/colors.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Container(
          width: double.infinity,
          height: 1600.h,
          margin: EdgeInsets.only(top: 70.h, bottom: 48.h , right: 85.w ,   ),
          padding: EdgeInsets.symmetric(horizontal: 48.sp, vertical: 32.sp ,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60.r),
            color: GilosNeutral800,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Saqlangan film va serialllar",
                style: CustomTextStyle.style600.copyWith(
                  color: Colors.white,
                  fontSize: 38.sp,
                ),
              ),
              32.sp.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 145.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Saqlanganlar mavjud emas" ,style: CustomTextStyle.style600.copyWith(fontSize:66.sp),),
                      60.w.verticalSpace,
                      Image.asset("assets/images/search_is_not.png",width:245.w , height: 291.h,)

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
