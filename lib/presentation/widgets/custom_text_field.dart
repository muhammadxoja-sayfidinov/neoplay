import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool onSubmitted;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.onSubmitted = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.focusNode, // FocusNode qo'shildi
    this.nextFocusNode, // FocusNode qo'shildi
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    // Add a listener to the focusNode to rebuild the widget when the focus changes.
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed of.
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextField(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.show');
        },

        onSubmitted: (value) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          FocusScope.of(context)
              .requestFocus(widget.nextFocusNode); // Klaviaturani yopish
        },
        focusNode: widget.focusNode,
        // FocusNode ni TextField ga bog'lash
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: lightGrey,
          hintText: widget.hintText,
          hintStyle: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              color: lightGrey,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
