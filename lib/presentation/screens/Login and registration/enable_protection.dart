import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';
import '../main_pages/main_navigation_page.dart';

class EnableProtection extends StatefulWidget {
  const EnableProtection({super.key});

  @override
  State<EnableProtection> createState() => _EnableProtectionState();
}

class _EnableProtectionState extends State<EnableProtection> {
  List<TextEditingController> pinControllers = List.generate(4, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  final FocusNode continueButtonFocusNode = FocusNode();
  final FocusNode cancelButtonFocusNode = FocusNode();

  @override
  void dispose() {
    // FocusNode larni tozalash
    for (var node in focusNodes) {
      node.dispose();
    }
    continueButtonFocusNode.dispose();
    cancelButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        height: size.height,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 350.w,
                    child: Text(
                      "PIN kodni yarating va eslab oling",
                      style: CustomTextStyle.style600.copyWith(
                        fontSize: 38.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 28.sp),
                          width: 72.w,
                          height: 72.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: focusNodes[index].hasFocus ? Colors.red : Colors.grey,
                              width: 2.w,
                            ),
                          ),
                          child: TextField(
                            controller: pinControllers[index],
                            focusNode: focusNodes[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (index < 3) {
                                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                                } else {
                                  focusNodes[index].unfocus();
                                  FocusScope.of(context).requestFocus(continueButtonFocusNode);
                                }
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                              }
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    color: red,
                    width: 380.w,
                    name: "Davom etish",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationPage()),
                      );
                    },
                    focusNode: continueButtonFocusNode, // Fokus qo'shish
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    color: grey,
                    width: 380.w,
                    name: "Bekor qilish",
                    onPressed: () {},
                    focusNode: cancelButtonFocusNode, // Fokus qo'shish
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
