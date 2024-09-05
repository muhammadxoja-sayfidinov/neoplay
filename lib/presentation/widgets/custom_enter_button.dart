import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomEnterButton extends StatefulWidget {
  final String svg;
  final String text;
  final VoidCallback onPressed;
  final FocusNode focusNode;

  CustomEnterButton({
    Key? key,
    required this.svg,
    required this.text,
    required this.onPressed,
    required this.focusNode,
  }) : super(key: key);

  @override
  _CustomEnterButtonState createState() => _CustomEnterButtonState();
}

class _CustomEnterButtonState extends State<CustomEnterButton> {
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
    final bool hasFocus = widget.focusNode.hasFocus;

    return Container(
      width: 420.w,
      height: 64.sp,
      decoration: BoxDecoration(
        color: hasFocus ? Colors.red : lightGrey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: TextButton(
        focusNode: widget.focusNode,
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 32.sp,
              child: SvgPicture.asset(widget.svg),
            ),
            SizedBox(
              width: 32.w,
            ),
            Text(
              widget.text,
              style: CustomTextStyle.style400
                  .copyWith(fontSize: 28.sp, color:hasFocus? Colors.white: Colors.white24),
            ),
          ],
        ),
      ),
    );
  }
}
