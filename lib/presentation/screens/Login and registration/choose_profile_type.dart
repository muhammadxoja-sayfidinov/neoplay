import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      profile1FocusNode.requestFocus();
    });
  }
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
  Widget  build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowDown): const _ToggleIntent(Direction.down),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const _ToggleIntent(Direction.up),
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): const _ToggleIntent(Direction.left),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): const _ToggleIntent(Direction.right),

        LogicalKeySet(LogicalKeyboardKey.select): const _ActivateIntent(),

      },
      child: Actions( actions: <Type, Action<Intent>>{
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
              color: focusNode.hasFocus ? Colors.red : Colors.transparent,
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
  void _handleToggle(Direction direction) {
    if (direction == Direction.down) {
      if(profile1FocusNode.hasFocus || profile2FocusNode.hasFocus){
       setState(() {
         manageProfilesButtonFocusNode.requestFocus();
       });
      }
    } else if (direction == Direction.up) {
          if(manageProfilesButtonFocusNode.hasFocus){
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


  void _toggleActivate() {
      if(manageProfilesButtonFocusNode.hasFocus){
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ManageProfiles()),
        );
      }
  }
}
enum Direction { up, down,left,right }

class _ToggleIntent extends Intent {
  const _ToggleIntent(this.direction);
  final Direction direction;
}

class _ActivateIntent extends Intent {
  const _ActivateIntent();
}
