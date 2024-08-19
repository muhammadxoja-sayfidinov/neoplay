import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';
import 'package:neoplay/presentation/widgets/custom_text_field.dart';

class ProfileEditing extends StatefulWidget {
  const ProfileEditing({super.key});

  @override
  State<ProfileEditing> createState() => _ProfileEditingState();
}

class _ProfileEditingState extends State<ProfileEditing> {
  String selectedGender = 'Erkak'; // Default selected gender

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 708.sp,
              padding: EdgeInsets.all(48.sp),
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profil ma’lumotlarini tahrirlash",
                    textAlign: TextAlign.left,
                    style: CustomTextStyle.style600.copyWith(fontSize: 38.sp),
                  ),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 120.r,
                        backgroundImage: AssetImage("assets/images/man_logo.png"),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Text(
                    "Profil nomi",
                    textAlign: TextAlign.start,
                    style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
                  ),
                  20.verticalSpace,
                  CustomTextField(hintText: "+998 93 908 70 85"),
                  32.verticalSpace,
                  Text(
                    "Yosh",
                    textAlign: TextAlign.start,
                    style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
                  ),
                  20.verticalSpace,
                  CustomTextField(
                    hintText: "18+",
                    keyboardType: TextInputType.number,
                  ),
                  32.verticalSpace,
                  Text(
                    "Jinsi",
                    textAlign: TextAlign.start,
                    style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
                  ),
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.circular(50.r)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'Erkak';
                              });
                            },
                            child: Container(
                              height: 56.sp,
                              decoration: BoxDecoration(
                                color: selectedGender == 'Erkak'
                                    ? grey
                                    : lightGrey,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Erkak',
                                  style: CustomTextStyle.style400.copyWith(
                                    fontSize: 24.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        20.horizontalSpace,
                        Expanded(


                          child:  GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'Ayol';
                              });
                            },
                            child: Container(
                              height: 56.sp,
                              decoration: BoxDecoration(
                                color: selectedGender == 'Ayol'
                                    ? grey
                                    : lightGrey,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Ayol',
                                  style: CustomTextStyle.style400.copyWith(
                                    fontSize: 24.sp,
                                    color:  Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  32.verticalSpace,
                  CustomButton(
                    color: red,
                    width: double.infinity,
                    name: "O'zgarishlarni saqlash",
                    onPressed: () {
                      // Implement save functionality here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
