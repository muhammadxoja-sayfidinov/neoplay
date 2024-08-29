import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/children_profile_editing.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/profile_editing.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/successfully_registered.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

class ManageProfiles extends StatefulWidget {
  const ManageProfiles({super.key});

  @override
  State<ManageProfiles> createState() => _ManageProfilesState();
}

class _ManageProfilesState extends State<ManageProfiles> {
  int _selectedIndex = -1;

  // FocusNode larni e'lon qilish
  final FocusNode profile1FocusNode = FocusNode();
  final FocusNode profile2FocusNode = FocusNode();
  final FocusNode saveButtonFocusNode = FocusNode();

  @override
  void dispose() {
    // FocusNode larni tozalash
    profile1FocusNode.dispose();
    profile2FocusNode.dispose();
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
                _buildProfileCard(0, '+998 93 908...', 'asosiy profil', 'assets/images/man_logo.png', (){
                  var push = Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileEditing()),
                  );
                }, profile1FocusNode),
                SizedBox(width: 40.w),
                _buildProfileCard(1, 'Bolalar profili', 'bolalar uchun', 'assets/images/children_logo.png',(){
                  var push = Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChildrenProfileEditing()),
                  );
                }, profile2FocusNode),
              ],
            ),
            SizedBox(height: 50.h),
            CustomButton(
              color: Colors.red,
              width: 708.sp,
              name: "Saqlash",
              onPressed: () {
                var push = Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuccessfullyRegistered()),
                );
              },
              focusNode: saveButtonFocusNode, // Fokusni qo'shish
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(int index, String title, String subtitle, String imagePath, VoidCallback onTap, FocusNode focusNode) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Focus(
        focusNode: focusNode, // Fokusni qo'shish
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
          decoration: BoxDecoration(
            color: grey,
            border: Border.all(
              color: isSelected ? Colors.red : Colors.transparent,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 120.r,
                    backgroundImage: AssetImage(imagePath),
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
              Positioned(
                top: 30.h,
                right: 30.w,
                child: TextButton(
                  child: SvgPicture.asset(
                    'assets/images/edit_logo.svg',
                  ),
                  onPressed: onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
