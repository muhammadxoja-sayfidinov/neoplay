import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/verification_code_page.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  void _handleSubmitted(String value, FocusNode nextFocusNode) {

  }
  @override
  Widget build(BuildContext context) {
    // FocusNode larni yarating
    final FocusNode phoneFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();
    final FocusNode confirmPasswordFocusNode = FocusNode();
    final FocusNode signUpButtonFocusNode = FocusNode();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Telefon raqam yoki pochtani kiriting",
            style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
          ),
          20.h.verticalSpace,
          CustomTextField(
            onSubmitted: (value) => _handleSubmitted(value, FocusNode()),
            hintText: '+998',
            keyboardType: TextInputType.phone,
            focusNode: phoneFocusNode, // FocusNode qo'shildi
          ),
          48.h.verticalSpace,
          Text(
            "Parol yarating",
            style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
          ),
          20.h.verticalSpace,
          CustomTextField(
            onSubmitted: (value) => _handleSubmitted(value, FocusNode()),
            hintText: '',
            obscureText: true,
            focusNode: passwordFocusNode, // FocusNode qo'shildi
          ),
          20.h.verticalSpace,
          Text(
            "Parolni takrorlang",
            style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
          ),
          20.h.verticalSpace,
          CustomTextField(
            onSubmitted: (value) => _handleSubmitted(value, FocusNode()),
            hintText: '',
            obscureText: true,
            focusNode: confirmPasswordFocusNode, // FocusNode qo'shildi
          ),
          32.h.verticalSpace,
          CustomButton(
            color: lightGrey,
            width: 420.w,
            name: "Kirish",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VerificationCodePage()),
              );
            },
            focusNode: signUpButtonFocusNode, // FocusNode qo'shildi
          ),
        ],
      ),
    );
  }
}
