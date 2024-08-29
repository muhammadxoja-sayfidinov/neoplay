import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/get_birthday.dart';
import 'package:neoplay/presentation/widgets/Custom_background.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

class VerificationCodePage extends StatefulWidget {
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final FocusNode _submitButtonFocusNode = FocusNode(); // Submit tugmasi uchun FocusNode

  bool _showError = false;

  @override
  void dispose() {
    // FocusNode larni tozalash
    for (var node in _focusNodes) {
      node.dispose();
    }
    _submitButtonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 680.sp,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ro'yxatdan o'tishni tasdiqlang",
                    style: CustomTextStyle.style600.copyWith(fontSize: 38.sp),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Raqamingiz yoki pochtangizga tasdiqlash kodini yubordik, iltimos, ushbu kodni kiriting',
                    style: CustomTextStyle.style400
                        .copyWith(color: Colors.white, fontSize: 28.sp),
                  ),
                  SizedBox(height: 24.h),
                  Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: EdgeInsets.all(4.w),
                          child: _buildCodeField(
                              _controllers[index], _focusNodes[index], index),
                        );
                      }),
                    ),
                  ),
                  if (_showError) ...[
                    SizedBox(height: 6.h),
                    Text(
                      'Kod xato yoki to’liq kiritilmagan!',
                      style: CustomTextStyle.style400
                          .copyWith(fontSize: 24.sp, color: red),
                    ),
                  ],
                  SizedBox(height: 24.h),
                  CustomButton(
                    onPressed: _validateInputs,
                    name: 'Tasdiqlash',
                    width: double.infinity,
                    color: red,
                    focusNode: _submitButtonFocusNode, // Fokusni qo'shish
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Siz 59 soniyadandan so'ng kodni qayta so'rashingiz mumkin",
                    style: CustomTextStyle.style400.copyWith(
                      color: Colors.white,
                      fontSize: 28.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 390.sp,
              child: Image(image: AssetImage('assets/images/Logo.png')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeField(TextEditingController controller, FocusNode focusNode, int index) {
    return Container(
      width: 72.w, // Square input field
      height: 72.w, // Square input field
      padding: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: focusNode.hasFocus
              ? Colors.white // Change border color to white when focused
              : controller.text.isEmpty && _showError
              ? Colors.red
              : grey,
          width: 2.0,
        ),
        color: grey,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.sp,
        ),
        textAlign: TextAlign.center, // Center text horizontally
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          setState(() {
            _showError = false; // Hide error message on change
          });
          if (value.isNotEmpty) {
            if (index < _focusNodes.length - 1) {
              _focusNodes[index + 1].requestFocus();
            } else {
              _focusNodes[index].unfocus();
              FocusScope.of(context).requestFocus(_submitButtonFocusNode); // Submit tugmasiga fokusni o'tkazish
            }
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  void _validateInputs() {
    setState(() {
      _showError = _controllers.any((controller) => controller.text.isEmpty);
    });

    if (!_showError) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GetBirthday()),
      );
    }
  }
}
