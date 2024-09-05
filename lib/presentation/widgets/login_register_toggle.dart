import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';

class LoginRegisterToggle extends StatefulWidget {
  final Function(int) onToggle;
  final String text1;
  final String text2;
  final FocusNode focusToggle1;
  final FocusNode focusToggle2;

  LoginRegisterToggle({
    required this.onToggle,
    required this.text1,
    required this.text2,
    required this.focusToggle1,
    required this.focusToggle2,
  });

  @override
  _LoginRegisterToggleState createState() => _LoginRegisterToggleState();
}

class _LoginRegisterToggleState extends State<LoginRegisterToggle> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(color: lightGrey, width: 2.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildToggleButton(widget.text1, 0, widget.focusToggle1),
            _buildToggleButton(widget.text2, 1, widget.focusToggle2),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, int index, FocusNode focusNode) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          widget.onToggle(index);
        });
      },
      child: Focus(
        focusNode: focusNode,
        onFocusChange: (hasFocus) {
          setState(() {

          });
        },
        onKey: (FocusNode node, RawKeyEvent event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
                node == widget.focusToggle1) {
              FocusScope.of(context).requestFocus(widget.focusToggle2);
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
                node == widget.focusToggle2) {
              FocusScope.of(context).requestFocus(widget.focusToggle1);
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.enter ||
                event.logicalKey == LogicalKeyboardKey.select) {
              setState(() {
                _selectedIndex = index;
                widget.onToggle(index);
              });
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        child: AnimatedOpacity(
          opacity: _selectedIndex == index ? 1.0 : 0.6,
          // Opacity based on selection
          duration: const Duration(milliseconds: 300),
          child: Container(
            height: 50.sp,
            width: 208.sp,
            decoration: BoxDecoration(
              color: focusNode.hasFocus
                  ? Colors.red
                  : _selectedIndex == index
                  ? lightGrey
                  : Colors.black,

              borderRadius: BorderRadius.circular(60.0),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color:  Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}