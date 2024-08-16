import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/main.dart';

class LoginRegisterToggle extends StatefulWidget {
  final Function(int) onToggle;
  final String text1;
  final String text2;

  LoginRegisterToggle(
      {required this.onToggle, required this.text1, required this.text2});

  @override
  _LoginRegisterToggleState createState() => _LoginRegisterToggleState();
}

class _LoginRegisterToggleState extends State<LoginRegisterToggle> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(60.0),
        border: Border.all(color: lightGrey,width: 2.sp)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildToggleButton(widget.text1, 0 ,130),
          _buildToggleButton(widget.text2, 1,280),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, int index,double width) {
    return Container(
      width: width.sp,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
            widget.onToggle(index);
          });
        },
        child: Container(
          height: 50.sp,

          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.red : Colors.black,
            borderRadius: BorderRadius.circular(60.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.white : lightGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
