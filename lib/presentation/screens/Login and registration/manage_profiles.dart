import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveButtonFocusNode.requestFocus();
  }
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
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowDown): const _ToggleIntent(Direction.down),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const _ToggleIntent(Direction.up),
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): const _ToggleIntent(Direction.left),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): const _ToggleIntent(Direction.right),
        LogicalKeySet(LogicalKeyboardKey.select): const _ActivateIntent(),

      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          _ToggleIntent: CallbackAction<_ToggleIntent>(
            onInvoke: (intent) => _handleToggle(intent.direction),
          ),
          _ActivateIntent: CallbackAction<_ActivateIntent>(
            onInvoke: (intent) => _toggleActivate(),
          ),
        },
        child: Scaffold(
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
                  color:lightGrey,
                  width: 708.sp,
                  name: "Saqlash",
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessfullyRegistered()),
                    );
                  },
                  focusNode: saveButtonFocusNode, // Fokusni qo'shish
                ),
              ],
            ),
          ),
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
              color: focusNode.hasFocus ? Colors.red : Colors.transparent,
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
              focusNode.hasFocus?Positioned(
                top: 30.h,
                right: 30.w,
                child: TextButton(
                  child: SvgPicture.asset(
                    'assets/images/edit_logo.svg',
                  ),
                  onPressed: onTap,
                ),
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
  void _handleToggle(Direction direction) {
    if (direction == Direction.down) {
      if(profile1FocusNode.hasFocus || profile2FocusNode.hasFocus){
        setState(() {
          saveButtonFocusNode.requestFocus();
        });
      }
    } else if (direction == Direction.up) {
      if(saveButtonFocusNode.hasFocus){
        setState(() {
          profile1FocusNode.requestFocus();
        });
      }
    }else if(direction == Direction.left){
      if(profile2FocusNode.hasFocus){
        setState(() {
          profile1FocusNode.requestFocus();
        });
      }
    }else if(direction == Direction.right){
      if(profile1FocusNode.hasFocus){
        setState(() {
          profile2FocusNode.requestFocus();
        });
      }
    }
  }
  void _toggleActivate(){
  if(saveButtonFocusNode.hasFocus){
  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SuccessfullyRegistered()),
  );
  }}

}
enum Direction { up, down,left ,right }

class _ToggleIntent extends Intent {
  const _ToggleIntent(this.direction);
  final Direction direction;
}

class _ActivateIntent extends Intent {
  const _ActivateIntent();
}
