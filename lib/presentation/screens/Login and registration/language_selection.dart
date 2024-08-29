import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

class LanguageSelection extends StatefulWidget {
  static final String id = "language_selection";
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  // Fokuslar uchun `FocusNode` larni e'lon qilamiz
  final FocusNode uzbekCyrillicFocusNode = FocusNode();
  final FocusNode uzbekLatinFocusNode = FocusNode();
  final FocusNode russianFocusNode = FocusNode();

  @override
  void dispose() {
    // FocusNode larni tozalash
    uzbekCyrillicFocusNode.dispose();
    uzbekLatinFocusNode.dispose();
    russianFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init() ni kontekst bilan chaqiramiz
    ScreenUtil.init(context);

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
              "Тилни танланг / Выбор языка",
              style: CustomTextStyle.style600.copyWith(fontSize: 36.sp),
            ),
            SizedBox(
              height: 64.h,
            ),
            CustomButton(
              color: red,
              width: 416.w,
              name: 'Ўзбек тили (крилл)',
              onPressed: () {},
              focusNode: uzbekCyrillicFocusNode, // Fokusni qo'shish
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              color: grey,
              width: 416.w,
              name: 'O’zbek tili (lotin)',
              onPressed: () {},
              focusNode: uzbekLatinFocusNode, // Fokusni qo'shish
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              color: grey,
              width: 416.w,
              name: 'Русский',
              onPressed: () {},
              focusNode: russianFocusNode, // Fokusni qo'shish
            ),
          ],
        ),
      ),
    );
  }
}
