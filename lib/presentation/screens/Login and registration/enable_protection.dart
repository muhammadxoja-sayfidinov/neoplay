import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<TextEditingController> pinControllers =
      List.generate(4, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  final FocusNode continueButtonFocusNode = FocusNode();
  final FocusNode cancelButtonFocusNode = FocusNode();
  FocusNode currentFocus = FocusNode(); // To track the currently focused widget

  @override
  void initState() {
    super.initState();
    currentFocus = focusNodes[0];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(currentFocus);
    });
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    continueButtonFocusNode.dispose();
    cancelButtonFocusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      LogicalKeyboardKey key = event.logicalKey;

      // Navigate right/left between the PIN fields
      if (key == LogicalKeyboardKey.arrowRight) {
        _focusNextField();
      } else if (key == LogicalKeyboardKey.arrowLeft) {
        _focusPreviousField();
      } else if (key == LogicalKeyboardKey.arrowDown) {
        for (var node in focusNodes) {
          if (node.hasFocus) {
            continueButtonFocusNode.requestFocus();
          }
        }

        if (continueButtonFocusNode.hasFocus) {
          cancelButtonFocusNode.requestFocus();
        }
      } else if (key == LogicalKeyboardKey.arrowUp) {
        if (cancelButtonFocusNode.hasFocus) {
          continueButtonFocusNode.requestFocus();
        } else if (continueButtonFocusNode.hasFocus) {
          focusNodes[0].requestFocus();
        }
      }

      // Submit actions on Enter or Select
      if (key == LogicalKeyboardKey.enter || key == LogicalKeyboardKey.select) {
        if (currentFocus == continueButtonFocusNode) {
          _navigateToMainPage();
        } else if (currentFocus == cancelButtonFocusNode) {
          _cancelAction();
        } else {
          _focusNextField();
        }
      }
    }
  }

  void _focusNextField() {
    setState(() {
      int currentIndex = focusNodes.indexOf(currentFocus);
      if (currentIndex < 3) {
        currentFocus = focusNodes[currentIndex + 1];
        FocusScope.of(context).requestFocus(currentFocus);
      } else {
        currentFocus = continueButtonFocusNode;
        FocusScope.of(context).requestFocus(currentFocus);
      }
    });
  }

  void _focusPreviousField() {
    setState(() {
      int currentIndex = focusNodes.indexOf(currentFocus);
      if (currentIndex > 0) {
        currentFocus = focusNodes[currentIndex - 1];
        FocusScope.of(context).requestFocus(currentFocus);
      } else if (currentFocus == continueButtonFocusNode) {
        currentFocus = focusNodes[3];
        FocusScope.of(context).requestFocus(currentFocus);
      }
    });
  }

  void _navigateToMainPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigationPage()),
    );
  }

  void _cancelAction() {
    // Perform cancel action here if needed
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return RawKeyboardListener(
      focusNode: FocusNode(), // The parent listener to capture keyboard events
      onKey: _handleKeyEvent,
      child: Scaffold(
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
                  SizedBox(
                    width: 390.sp,
                    child: const Image(
                        image: AssetImage('assets/images/Logo.png')),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
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
                                color: focusNodes[index].hasFocus
                                    ? Colors.red
                                    : Colors.grey,
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
                              decoration: const InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  _focusNextField();
                                }
                                setState(() {}); // Update border color on focus
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      color: grey,
                      width: 380.w,
                      name: "Davom etish",
                      onPressed: _navigateToMainPage,
                      focusNode: continueButtonFocusNode, // Focus management
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      color: grey,
                      width: 380.w,
                      name: "Bekor qilish",
                      onPressed: _cancelAction,
                      focusNode: cancelButtonFocusNode, // Focus management
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
