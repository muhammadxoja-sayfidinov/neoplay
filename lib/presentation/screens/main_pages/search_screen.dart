import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    decoration: InputDecoration(

                      icon: Icon(Icons.search , color: gilosNeutral,),

                      hintText: "Film, serial, multfilm izlang",
                      hintStyle: CustomTextStyle.style400.copyWith(fontSize: 24.sp , color: gilosNeutral ,),

                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                )
              ),

            32.h.horizontalSpace,

            Container(
              decoration: BoxDecoration(

              ),
            )
          ],

    );
  }
}

