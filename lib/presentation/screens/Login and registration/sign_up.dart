import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/verification_code_page.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          Text("Telefon raqam yoki pochtani kiriting", style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),),
          20.h.verticalSpace,
          CustomTextField(

            hintText: '+998',
            keyboardType: TextInputType.phone,
          ),
          48.h.verticalSpace,
          Text("Parol yarating", style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),),
          20.h.verticalSpace,
          CustomTextField(
            hintText: '',
            obscureText: true,
          ),
          20.h.verticalSpace,
          Text("Parolni takrorlang", style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),),
          20.h.verticalSpace,
          CustomTextField(
            hintText: '',
            obscureText: true,
          ),
          32.h.verticalSpace,
          CustomButton(color: lightGrey, width: 420.w, name: "Kirish", onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VerificationCodePage()),
            );
          }),

        ],
      ),
    );
  }
}
