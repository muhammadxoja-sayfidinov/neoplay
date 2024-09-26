import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';
import 'package:neoplay/presentation/widgets/custom_text_field.dart';

class AddNewProfile extends StatefulWidget {
  const AddNewProfile({super.key});

  @override
  State<AddNewProfile> createState() => _AddNewProfileState();
}

class _AddNewProfileState extends State<AddNewProfile> {
  final List<String> avatarList = [
    "assets/profile_images/ava_1.png",
    "assets/profile_images/ava_2.png",
    "assets/profile_images/ava_3.png",
    "assets/profile_images/ava_4.png",
    "assets/profile_images/ava_5.png",
    "assets/profile_images/ava_6.png",
    "assets/profile_images/ava_7.png",
    "assets/profile_images/ava_8.png",
    "assets/profile_images/ava_2.png",
    "assets/profile_images/ava_3.png",
    "assets/profile_images/ava_4.png",
    "assets/profile_images/ava_5.png",
    "assets/profile_images/ava_6.png",
    "assets/profile_images/ava_7.png",
    "assets/profile_images/ava_8.png",
  ];

  String selectedGender = 'Erkak'; // Default selected gender
  String avatarPath = "";

  // Fokusni boshqarish uchun FocusNode larni e'lon qilish
  final FocusNode profileNameFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode maleGenderFocusNode = FocusNode();
  final FocusNode femaleGenderFocusNode = FocusNode();
  final FocusNode saveButtonFocusNode = FocusNode();
  bool avatar = true;

  void _handleSubmitted(String value, FocusNode nextFocusNode) {
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  @override
  void dispose() {
    profileNameFocusNode.dispose();
    ageFocusNode.dispose();
    maleGenderFocusNode.dispose();
    femaleGenderFocusNode.dispose();
    saveButtonFocusNode.dispose();
    super.dispose();
  }

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
            avatar
                ? Container(
                    width: 700.w,
                    padding: EdgeInsets.all(48.sp),
                    decoration: BoxDecoration(
                      color: GilosNeutral800,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yangi profil ma’lumotlarini kiriting",
                          textAlign: TextAlign.left,
                          style: CustomTextStyle.style600
                              .copyWith(fontSize: 38.sp),
                        ),
                        24.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  avatar = false;
                                });
                              },
                              child: Container(
                                width: 200.w,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: avatarPath.isNotEmpty
                                      ? DecorationImage(
                                          image: AssetImage(avatarPath),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                  // No image if avatarPath is empty
                                  color:
                                      avatarPath.isEmpty ? Colors.grey : null,
                                  // Set color only when there's no image
                                  border:
                                      Border.all(width: 5.w, color: Colors.red),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                      width: 39.5.w,
                                      "assets/images/add_photo_profile.svg"),
                                ),
                              ),
                            )
                          ],
                        ),
                        24.verticalSpace,
                        Text(
                          "Profil nomi",
                          textAlign: TextAlign.start,
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp),
                        ),
                        20.verticalSpace,
                        CustomTextField(
                          hintText: "+998 93 908 70 85",
                          focusNode: profileNameFocusNode, // Fokusni qo'shish
                        ),
                        32.verticalSpace,
                        Text(
                          "Yosh",
                          textAlign: TextAlign.start,
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp),
                        ),
                        20.verticalSpace,
                        CustomTextField(
                          hintText: "18+",
                          keyboardType: TextInputType.number,
                          focusNode: ageFocusNode, // Fokusni qo'shish
                        ),
                        32.verticalSpace,
                        Text(
                          "Jinsi",
                          textAlign: TextAlign.start,
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp),
                        ),
                        20.verticalSpace,
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: lightGrey,
                              borderRadius: BorderRadius.circular(50.r)),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedGender = 'Erkak';
                                    });
                                  },
                                  child: Focus(
                                    focusNode: maleGenderFocusNode,
                                    // Fokusni qo'shish
                                    child: Container(
                                      height: 56.sp,
                                      decoration: BoxDecoration(
                                        color: selectedGender == 'Erkak'
                                            ? grey
                                            : lightGrey,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Erkak',
                                          style:
                                              CustomTextStyle.style400.copyWith(
                                            fontSize: 24.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              20.horizontalSpace,
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedGender = 'Ayol';
                                    });
                                  },
                                  child: Focus(
                                    focusNode: femaleGenderFocusNode,
                                    // Fokusni qo'shish
                                    child: Container(
                                      height: 56.sp,
                                      decoration: BoxDecoration(
                                        color: selectedGender == 'Ayol'
                                            ? grey
                                            : lightGrey,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Ayol',
                                          style:
                                              CustomTextStyle.style400.copyWith(
                                            fontSize: 24.sp,
                                            color: Colors.white,
                                          ),
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
                          focusNode: saveButtonFocusNode, // Fokusni qo'shish
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: 836.w,
                    height: 700.h,
                    padding: EdgeInsets.all(70.sp),
                    decoration: BoxDecoration(
                      color: GilosNeutral800,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yangi profil ma’lumotlarini kiriting",
                            textAlign: TextAlign.left,
                            style: CustomTextStyle.style600
                                .copyWith(fontSize: 38.sp),
                          ),
                          24.verticalSpace,
                          Expanded(
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                  ),
                                  itemCount: avatarList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          avatarPath = avatarList[index];
                                          avatar = true;
                                        });
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
                                                  image: AssetImage(
                                                      avatarList[index]),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100.0.r)),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })),
                        ]))
          ],
        ),
      ),
    );
  }
}
