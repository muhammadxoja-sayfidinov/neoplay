import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/get_children_age.dart';

import '../../../core/constants/colors.dart';

import '../../../core/constants/style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ChildrenProfileEditing extends StatefulWidget {
  const ChildrenProfileEditing({super.key});

  @override
  State<ChildrenProfileEditing> createState() => _ChildrenProfileEditingState();
}

class _ChildrenProfileEditingState extends State<ChildrenProfileEditing> {
  // Fokusni boshqarish uchun FocusNode larni yarating
  final FocusNode profileNameFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode saveButtonFocusNode = FocusNode();

  @override
  void dispose() {
    // FocusNode larni tozalash
    profileNameFocusNode.dispose();
    ageFocusNode.dispose();
    saveButtonFocusNode.dispose();
    super.dispose();
  }

  void _handleSubmitted(String value, FocusNode nextFocusNode) {
    FocusScope.of(context).requestFocus(nextFocusNode);
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
            Container(
              width: 708.sp,
              padding: EdgeInsets.all(48.sp),
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: FocusTraversalGroup(
                policy: WidgetOrderTraversalPolicy(),
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
                          backgroundImage: const AssetImage(
                              "assets/images/children_logo.png"),
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
                    CustomTextField(
                      hintText: "Bolalar profili",
                      focusNode: profileNameFocusNode, // Fokusni qo'shish
                    ),
                    32.verticalSpace,
                    Text(
                      "Yosh",
                      textAlign: TextAlign.start,
                      style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
                    ),
                    20.verticalSpace,
                    CustomTextField(
                      hintText: "12-",
                      keyboardType: TextInputType.number,
                      focusNode: ageFocusNode, // Fokusni qo'shish
                    ),
                    32.verticalSpace,
                    CustomButton(
                      color: red,
                      width: double.infinity,
                      name: "O'zgarishlarni saqlash",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GetChildrenAge()),
                        );
                      },
                      focusNode: saveButtonFocusNode, // Fokusni qo'shish
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
