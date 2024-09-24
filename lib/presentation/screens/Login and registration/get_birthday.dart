import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/choose_profile_type.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/successfully_registered.dart';
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
  final FocusNode _continueButtonFocusNode = FocusNode();

  bool _isDayValid = true;
  bool _isMonthValid = true;
  bool _isYearValid = true;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _continueButtonFocusNode.addListener(_onFocusChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_dayFocusNode);
    });
  }

  void _onFocusChange() {
    setState(() {
      _continueButtonFocusNode.hasFocus ? Colors.red : lightGrey;
    });
  }

  void _validateAndSubmit() {
    setState(() {
      _isDayValid = _dayController.text.length == 2;
      _isMonthValid = _monthController.text.length == 2;
      _isYearValid = _yearController.text.length == 4;

      _showError = !(_isDayValid && _isMonthValid && _isYearValid);

      if (!_showError) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SuccessfullyRegistered()),
        );
      }
    });
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      LogicalKeyboardKey key = event.logicalKey;

      if (key == LogicalKeyboardKey.arrowRight) {
        if (_dayFocusNode.hasFocus) {
          _monthFocusNode.requestFocus();
        } else if (_monthFocusNode.hasFocus) {
          _yearFocusNode.requestFocus();
        }
      } else if (key == LogicalKeyboardKey.arrowLeft) {
        if (_monthFocusNode.hasFocus) {
          _dayFocusNode.requestFocus();
        } else if (_yearFocusNode.hasFocus) {
          _monthFocusNode.requestFocus();
        }
      } else if (key == LogicalKeyboardKey.arrowDown) {
        _continueButtonFocusNode.requestFocus();
      } else if (key == LogicalKeyboardKey.arrowUp) {
        if (_continueButtonFocusNode.hasFocus) {
          _yearFocusNode.requestFocus();
        }
      } else if (key == LogicalKeyboardKey.select) {
        _toggleActivate();
      } else if (key == LogicalKeyboardKey.enter) {
        FocusScope.of(context).nextFocus();
      }
    }
  }

  void _toggleActivate() {
    if (_continueButtonFocusNode.hasFocus) {
      _validateAndSubmit();
    }
  }

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    _dayFocusNode.dispose();
    _monthFocusNode.dispose();
    _yearFocusNode.dispose();
    _continueButtonFocusNode.dispose();
    super.dispose();
  }

  Widget _buildCodeField(TextEditingController controller, FocusNode focusNode,
      double width, String hintText) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {}); // Rebuild on focus change to update the border color
      },
      child: Container(
        width: width,
        height: 72.w,
        padding: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: focusNode.hasFocus
                ? Colors.white
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
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: width == 140.w ? 4 : 2,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5), fontSize: 24.sp),
            counterText: "",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _showError = false; // Hide error message on change
            });
            if (value.length == (width == 140.w ? 4 : 2)) {
              if (focusNode == _dayFocusNode) {
                _monthFocusNode.requestFocus();
              } else if (focusNode == _monthFocusNode) {
                _yearFocusNode.requestFocus();
              }
            }
          },
          onFieldSubmitted: (value) {
            if (focusNode == _yearFocusNode) {
              _validateAndSubmit();
            } else if (focusNode == _dayFocusNode) {
              _monthFocusNode.requestFocus();
            } else if (focusNode == _monthFocusNode) {
              _yearFocusNode.requestFocus();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: _handleKeyEvent,
      child: Scaffold(
        body: CustomBackground(
          widget: Row(
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
                        _buildCodeField(
                            _dayController, _dayFocusNode, 100.w, 'Kun'),
                        SizedBox(width: 16.w),
                        _buildCodeField(
                            _monthController, _monthFocusNode, 100.w, 'Oy'),
                        SizedBox(width: 16.w),
                        _buildCodeField(
                            _yearController, _yearFocusNode, 140.w, 'Yil'),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    CustomButton(
                      onPressed: _validateAndSubmit,
                      name: 'Davom etish',
                      width: double.infinity,
                      color: lightGrey,
                      focusNode: _continueButtonFocusNode,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 390.sp,
                child: Image.asset('assets/images/Logo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
