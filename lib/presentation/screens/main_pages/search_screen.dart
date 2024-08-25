import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
              Container(
                      padding: EdgeInsets.symmetric(horizontal: 600.w),
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(60.r),bottomRight:Radius.circular(60.r))
                    ),
                child: Center(
                  child: TextField(

                    controller: _searchController,
                    style:  CustomTextStyle.style400.copyWith(fontSize: 24.sp , color: gilosNeutralWhite ,),
                    decoration: InputDecoration(

                      icon: Container(
                        width: 36.w ,
                        child: SvgPicture.asset("assets/images/search_logo.svg"),
                      ),

                      hintText: "Film, serial, multfilm izlang",
                      hintStyle: CustomTextStyle.style400.copyWith(fontSize: 24.sp , color: gilosNeutral ,),

                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                )
              ),

            32.h.verticalSpace,

            Container(
              width: double.infinity,

              padding: EdgeInsets.symmetric(vertical: 32.h , horizontal: 48.w),
              decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(60.r)
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saqlangan film va serialllar",style:CustomTextStyle.style600.copyWith(fontSize: 38.sp),
                  ),
                  66.h.verticalSpace,
                  Container(
                    width: double.infinity,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center ,
                    children: [
                      Text("Bunday film\nmavjud emas",style: CustomTextStyle.style600.copyWith(fontSize: 66.sp),),
                      60.w.horizontalSpace,
                      Container(
                        width: 244.w,
                        height: 290.h,
                        child: Image(image: AssetImage("assets/images/search_is_not.png")),
                      )
                    ],
                  )),
                  470.h.verticalSpace,
                ],
              ) ,
            )
          ],

    );
  }
}

