import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/enable_protection.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

class SuccessfullyRegistered extends StatefulWidget {
  const SuccessfullyRegistered({super.key});

  @override
  State<SuccessfullyRegistered> createState() => _SuccessfullyRegisteredState();
}

class _SuccessfullyRegisteredState extends State<SuccessfullyRegistered> {
  // FocusNode larni e'lon qilish
  final FocusNode enableProtectionButtonFocusNode = FocusNode();
  final FocusNode laterButtonFocusNode = FocusNode();

  @override
  void dispose() {
    // FocusNode larni tozalash
    enableProtectionButtonFocusNode.dispose();
    laterButtonFocusNode.dispose();
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
        padding: EdgeInsets.symmetric(vertical: 87.sp, horizontal: 120.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 390.sp,
                  child: Image(image: AssetImage('assets/images/Logo.png')),
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 402.sp,
                    child: Image(image: AssetImage('assets/images/kattalar.png')),
                  ),
                  Container(
                    width: 704.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ajoyib! Siz 3 ta oila a'zongiz uchun profil yaratishingiz, shuningdek, kattalar profilini bolalardan himoya qilishingiz mumkin",
                          style: CustomTextStyle.style600.copyWith(fontSize: 38.sp),
                        ),
                        40.sp.verticalSpace,
                        Text(
                          "Agar qurilmadan bolalar foydalanishi mumkin bo'lsa, himoyani yoqishni tavsiya qilamiz. Keyin, kattalar profiliga o'tish uchun siz faqat o'zingiz biladigan kodni kiritishingiz kerak bo'ladi.",
                          style: CustomTextStyle.style400.copyWith(fontSize: 28.sp),
                        ),
                        48.sp.verticalSpace,
                        Row(
                          children: [
                            CustomButton(
                              color: red,
                              width: 300.sp,
                              name: "Himoyani yoqish",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EnableProtection()),
                                );
                              },
                              focusNode: enableProtectionButtonFocusNode, // Fokusni qo'shish
                            ),
                            32.sp.horizontalSpace,
                            CustomButton(
                              color: grey,
                              width: 200.sp,
                              name: "Keyinroq",
                              onPressed: () {},
                              focusNode: laterButtonFocusNode, // Fokusni qo'shish
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 402.sp,
                    child: Image(image: AssetImage('assets/images/kids.png')),
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
