import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/main_pages/main_navigation_page.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_enter_button.dart';
import '../../widgets/custom_text_field.dart';
import 'access _via _qr _code.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FocusNode qrFocusNode = FocusNode();
  final FocusNode googleFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode loginButtonFocusNode = FocusNode();
  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            _handleToggle(Direction.down);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            _handleToggle(Direction.up);
          } else if (event.logicalKey == LogicalKeyboardKey.select ||
              event.logicalKey == LogicalKeyboardKey.enter) {
            _toggleActivate();
          }
        }
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FocusScope(
          autofocus: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomEnterButton(
                svg: "assets/images/qr_logo.svg",
                text: "Qr kod orqali kirish",
                focusNode: qrFocusNode,
                onPressed: () {
                  Navigator.pushNamed(context, AccesViaQrCode.id);
                },
              ),
              SizedBox(height: 16.h),
              CustomEnterButton(
                svg: "assets/images/google_logo.svg",
                text: "Google orqali kirish",
                focusNode: googleFocusNode,
                onPressed: () {},
              ),
              Divider(
                color: lightGrey,
                height: 96.h,
                thickness: 2.sp,
                indent: 30.sp,
                endIndent: 30.sp,
              ),
              Text(
                "Pochta yoki telefon raqam bilan kirish",
                style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
              ),
              20.h.verticalSpace,
              CustomTextField(
                hintText: '+998',
                keyboardType: TextInputType.phone,
                focusNode: phoneFocusNode,
                nextFocusNode: passwordFocusNode,
              ),
              48.h.verticalSpace,
              Text(
                "Parolingiz",
                style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
              ),
              20.h.verticalSpace,
              CustomTextField(
                hintText: '',
                obscureText: true,
                focusNode: passwordFocusNode,
                nextFocusNode: loginButtonFocusNode,
              ),
              32.h.verticalSpace,
              CustomButton(
                color: loginButtonFocusNode.hasFocus ? red : lightGrey,
                width: 420.w,
                name: "Kirish",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainNavigationPage()),
                  );
                },
                focusNode: loginButtonFocusNode,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleToggle(Direction direction) {
    if (direction == Direction.down) {
      if (qrFocusNode.hasFocus) {
        googleFocusNode.requestFocus();
      } else if (googleFocusNode.hasFocus) {
        phoneFocusNode.requestFocus();
      } else if (phoneFocusNode.hasFocus) {
        passwordFocusNode.requestFocus();
      } else if (passwordFocusNode.hasFocus) {
        loginButtonFocusNode.requestFocus();
      }
    } else if (direction == Direction.up) {
      if (loginButtonFocusNode.hasFocus) {
        passwordFocusNode.requestFocus();
      } else if (passwordFocusNode.hasFocus) {
        phoneFocusNode.requestFocus();
      } else if (phoneFocusNode.hasFocus) {
        googleFocusNode.requestFocus();
      } else if (googleFocusNode.hasFocus) {
        qrFocusNode.requestFocus();
      }
    }
  }

  void _toggleActivate() {
    if (qrFocusNode.hasFocus) {
      Navigator.pushNamed(context, AccesViaQrCode.id);
    } else if (googleFocusNode.hasFocus) {
      // Handle Google login logic
    } else if (loginButtonFocusNode.hasFocus) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainNavigationPage()),
      );
    } else if (phoneFocusNode.hasFocus || passwordFocusNode.hasFocus) {
      setState(() {
        onTap = true;
      });
    }
  }
}

enum Direction { up, down }
