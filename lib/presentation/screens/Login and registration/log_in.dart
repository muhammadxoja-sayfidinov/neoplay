import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/access%20_via%20_qr%20_code.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';
import 'package:neoplay/presentation/widgets/custom_enter_button.dart';

import '../../widgets/custom_text_field.dart';
class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomEnterButton(svg: "assets/images/qr_logo.svg", text: "Qr kod orqali kirish", onPressed: (){

            Navigator.pushNamed(context, AccesViaQrCode.id);
          }),
          SizedBox(
            height:16.h ,
          ),
          CustomEnterButton(svg: "assets/images/google_logo.svg", text: "Google orqali kirish", onPressed: (){}),

          Divider(
            color: lightGrey,
            height: 96.h,
            thickness: 2.sp,
            indent: 30.sp,
            endIndent: 30.sp,
          ),

          Text("Pochta yoki telefon raqam bilan kirish", style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),),
          20.h.verticalSpace,
          CustomTextField(

            hintText: '+998',
            keyboardType: TextInputType.phone,
          ),
          48.h.verticalSpace,
          Text("Parolingiz", style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),),
          20.h.verticalSpace,
          CustomTextField(
            hintText: '',
            obscureText: true,
          ),
          32.h.verticalSpace,
          CustomButton(color: lightGrey, width: 420.w, name: "Kirish", onPressed: (){}),

        ],
      ),
    );
  }
}
