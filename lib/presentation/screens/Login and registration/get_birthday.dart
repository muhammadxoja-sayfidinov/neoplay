import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/widgets/Custom_background.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/style.dart';
import '../../widgets/custom_button.dart';

class GetBirthday extends StatefulWidget {
  const GetBirthday({super.key});

  @override
  State<GetBirthday> createState() => _GetBirthdayState();
}

class _GetBirthdayState extends State<GetBirthday> {
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  final FocusNode _dayFocusNode = FocusNode();
  final FocusNode _monthFocusNode = FocusNode();
  final FocusNode _yearFocusNode = FocusNode();

  bool _isDayValid = true;
  bool _isMonthValid = true;
  bool _isYearValid = true;
  bool _showError = false;

  void _validateAndSubmit() {
    setState(() {
      _isDayValid = _dayController.text.length == 2;
      _isMonthValid = _monthController.text.length == 2;
      _isYearValid = _yearController.text.length == 4;

      _showError = !(_isDayValid && _isMonthValid && _isYearValid);

      if (!_showError) {
        // Proceed with the form submission or navigation
      }
    });
  }

  void _onDayChanged(String value) {
    if (value.length >= 2) {
      if (value.length > 2) {
        _monthController.text = value.substring(2);
        _dayController.text = value.substring(0, 2);
        FocusScope.of(context).requestFocus(_monthFocusNode);
      } else {
        FocusScope.of(context).requestFocus(_monthFocusNode);
      }
    }
  }

  void _onMonthChanged(String value) {
    if (value.length >= 2) {
      if (value.length > 2) {
        _yearController.text = value.substring(2);
        _monthController.text = value.substring(0, 2);
        FocusScope.of(context).requestFocus(_yearFocusNode);
      } else {
        FocusScope.of(context).requestFocus(_yearFocusNode);
      }
    }
  }

  void _onYearChanged(String value) {
    if (value.length > 4) {
      _yearController.text = value.substring(0, 4);
    }
  }

  Widget _buildCodeField(TextEditingController controller, FocusNode focusNode, double width, String hintText) {
    return Container(
      width: width,
      height: 72.w, // Keep height consistent
      padding: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: focusNode.hasFocus
              ? Colors.white // Change border color to white when focused
              : (controller.text.isEmpty && !_showError)
              ? grey
              : controller.text.isEmpty
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
        maxLength: width == 140.w ? 4 : 2, // Set max length based on width
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 24.sp),
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          setState(() {
            _showError = false; // Hide error message on change
          });
          if (value.length == (width == 140.w ? 4 : 2)) {
            if (focusNode == _dayFocusNode) {
              _onDayChanged(value);
            } else if (focusNode == _monthFocusNode) {
              _onMonthChanged(value);
            } else if (focusNode == _yearFocusNode) {
              _onYearChanged(value);
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    _dayFocusNode.dispose();
    _monthFocusNode.dispose();
    _yearFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        widget:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             width: 600.sp,
             padding: EdgeInsets.symmetric(horizontal: 24.w),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   "Tug’ilgan kungizni kiriting",
                   style: CustomTextStyle.style600.copyWith(fontSize: 38.sp),
                 ),
                 SizedBox(height: 16.h),
                 Text(
                   'Bu bilan sizga mos film va seriallar tavsiya qilishimiz osonlashadi',
                   style: CustomTextStyle.style400.copyWith(
                     color: Colors.white,
                     fontSize: 28.sp,
                   ),
                 ),
                 SizedBox(height: 16.h),
                 if (_showError)
                   Text(
                     "Kataklar to'liq emas",
                     style: TextStyle(color: Colors.red, fontSize: 24.sp),
                   ),
                 SizedBox(height: 16.h),
                 Row(
                   children: [
                     _buildCodeField(_dayController, _dayFocusNode, 100.w, 'Kun'),
                     SizedBox(width: 16.w),
                     _buildCodeField(_monthController, _monthFocusNode, 100.w, 'Oy'),
                     SizedBox(width: 16.w),
                     _buildCodeField(_yearController, _yearFocusNode, 140.w, 'Yil'),
                   ],
                 ),
                 SizedBox(height: 32.h),
                 CustomButton(
                   onPressed: _validateAndSubmit,
                   name: 'Davom etish',
                   width: double.infinity,
                   color: red,
                 ),
               ],
             ),
           ),
           Container(
             width: 390.sp,
             child: Image(image: AssetImage('assets/images/Logo.png')),
           )
         ],
        )
      ),
    );
  }
}
