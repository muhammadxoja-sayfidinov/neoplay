import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/manage_profiles.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

class ChooseProfileType extends StatefulWidget {
  const ChooseProfileType({super.key});

  @override
  State<ChooseProfileType> createState() => _ChooseProfileTypeState();
}

class _ChooseProfileTypeState extends State<ChooseProfileType> {
  int _selectedIndex = -1;

  // FocusNode larni e'lon qilish
  final FocusNode profile1FocusNode = FocusNode();
  final FocusNode profile2FocusNode = FocusNode();
  final FocusNode manageProfilesButtonFocusNode = FocusNode();

  @override
  void dispose() {
    // Fokuslarni tozalash
    profile1FocusNode.dispose();
    profile2FocusNode.dispose();
    manageProfilesButtonFocusNode.dispose();
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
              "Kim tomosha qiladi?",
              style: CustomTextStyle.style600.copyWith(
                fontSize: 66.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50.h),
            FocusTraversalGroup(
              policy: WidgetOrderTraversalPolicy(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProfileCard(0, '+998 93 908...', 'asosiy profil', 'assets/images/man_logo.png', profile1FocusNode),
                  SizedBox(width: 40.w),
                  _buildProfileCard(1, 'Bolalar profili', 'bolalar uchun', 'assets/images/children_logo.png', profile2FocusNode),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            CustomButton(
              color: lightGrey,
              width: 708.sp,
              name: "Profillarni boshqarish",
              onPressed: () {
                var push = Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageProfiles()),
                );
              },
              focusNode: manageProfilesButtonFocusNode, // Fokus qo'shish
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(int index, String title, String subtitle, String imagePath, FocusNode focusNode) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Focus(
        focusNode: focusNode, // Fokus qo'shish
        child: Container(
          padding: EdgeInsets.only(left: 40.sp, right: 40.sp, top: 20.sp, bottom: 20.sp),
          decoration: BoxDecoration(
            color: grey,
            border: Border.all(
              color: isSelected ? Colors.red : Colors.transparent,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Column(
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
        ),
      ),
    );
  }
}
