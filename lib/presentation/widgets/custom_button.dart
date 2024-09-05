import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String name;
  final double width;
  final Color color;
  final FocusNode focusNode;

  const CustomButton({
    Key? key,
    required this.color,
    required this.width,
    required this.name,
    required this.onPressed,
    required this.focusNode,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.color;
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
    setState(() {
      _currentColor = widget.focusNode.hasFocus ? Colors.red : widget.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 64.h,
      decoration: BoxDecoration(
        color: _currentColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Focus(
        focusNode: widget.focusNode,
        child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 28.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
