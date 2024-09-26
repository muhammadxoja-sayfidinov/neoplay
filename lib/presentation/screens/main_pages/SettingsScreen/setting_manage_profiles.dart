import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/style.dart';
import '../../../widgets/custom_button.dart';
import '../../Login and registration/children_profile_editing.dart';
import '../../Login and registration/profile_editing.dart';
import '../../Login and registration/successfully_registered.dart';

class SettingManageProfiles extends StatefulWidget {
  const SettingManageProfiles({super.key});

  @override
  State<SettingManageProfiles> createState() => _SettingManageProfilesState();
}

class _SettingManageProfilesState extends State<SettingManageProfiles> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    profile1FocusNode.requestFocus();
  }

  final FocusNode profile1FocusNode = FocusNode();
  final FocusNode profile2FocusNode = FocusNode();
  final FocusNode profile3FocusNode = FocusNode();
  final FocusNode saveButtonFocusNode = FocusNode();

  @override
  void dispose() {
    profile1FocusNode.dispose();
    profile2FocusNode.dispose();
    profile3FocusNode.dispose();
    saveButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              _handleToggle(Direction.down);
            } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              _handleToggle(Direction.up);
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              _handleToggle(Direction.left);
            } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              _handleToggle(Direction.right);
            } else if (event.logicalKey == LogicalKeyboardKey.enter) {
              _toggleActivate();
            }
          }
        },
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Profillarni boshqarish",
                style: CustomTextStyle.style600.copyWith(
                  fontSize: 66.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "5 tagacha kattalar va bolalar uchun profilni yarating, o'zgartirishlar kiriting va keraksizlarini o'chirib tashlashingiz ham mumkin",
                style: CustomTextStyle.style400.copyWith(
                  fontSize: 28.sp,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProfileCard(
                    0,
                    '+998 93 908...',
                    'asosiy profil',
                    'assets/images/man_logo.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileEditing()),
                      );
                    },
                    profile1FocusNode,
                  ),
                  SizedBox(width: 40.w),
                  _buildProfileCard(
                    1,
                    'Bolalar profili',
                    'bolalar uchun',
                    'assets/images/children_logo.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ChildrenProfileEditing()),
                      );
                    },
                    profile2FocusNode,
                  ),
                  SizedBox(width: 40.w),
                  _buildProfileCard(
                    2,
                    'Profil qo’shish',
                    '',
                    '',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ChildrenProfileEditing()),
                      );
                    },
                    profile3FocusNode,
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              CustomButton(
                color: lightGrey,
                width: 708.sp,
                name: "Saqlash",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessfullyRegistered()),
                  );
                },
                focusNode: saveButtonFocusNode,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(int index, String title, String subtitle,
      String imagePath, VoidCallback onTap, FocusNode focusNode) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Focus(
        focusNode: focusNode,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
          decoration: BoxDecoration(
            color: grey,
            border: Border.all(
              color: focusNode.hasFocus ? Colors.red : Colors.transparent,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  imagePath.isNotEmpty
                      ? CircleAvatar(
                          radius: 130.r,
                          backgroundImage: AssetImage(imagePath),
                        )
                      : Container(
                          width: 260.w,
                          height: 260.w,
                          decoration: BoxDecoration(
                              color: gilosNeutral600,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              )),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/addprofile.svg',
                            ),
                          ),
                        ),
                  SizedBox(height: 20.h),
                  Text(
                    title,
                    style: CustomTextStyle.style600.copyWith(
                      fontSize: 36.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: CustomTextStyle.style400.copyWith(
                      fontSize: 28.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              imagePath.isNotEmpty
                  ? Positioned(
                      top: 70.h,
                      right: 80.w,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            width: 64.w,
                            'assets/images/edit_logo.svg',
                          ),
                          6.verticalSpace,
                          Text(
                            "O’zgartirish",
                            style: CustomTextStyle.style500
                                .copyWith(fontSize: 18.sp, color: Colors.white),
                          )
                        ],
                      ))
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void _handleToggle(Direction direction) {
    setState(() {
      if (direction == Direction.down) {
        if (profile1FocusNode.hasFocus || profile2FocusNode.hasFocus) {
          saveButtonFocusNode.requestFocus();
        }
      } else if (direction == Direction.up) {
        if (saveButtonFocusNode.hasFocus) {
          profile1FocusNode.requestFocus();
        }
      } else if (direction == Direction.left) {
        if (profile2FocusNode.hasFocus || profile3FocusNode.hasFocus) {
          profile1FocusNode.requestFocus();
        }
      } else if (direction == Direction.right) {
        if (profile1FocusNode.hasFocus || profile2FocusNode.hasFocus) {
          profile3FocusNode.requestFocus();
        }
      }
    });
  }

  void _toggleActivate() {
    if (saveButtonFocusNode.hasFocus) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuccessfullyRegistered()),
      );
    }
  }
}

enum Direction { up, down, left, right }
