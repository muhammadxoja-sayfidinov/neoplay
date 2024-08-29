import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/log_in.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/sign_up.dart';
import 'package:neoplay/presentation/widgets/Custom_background.dart';
import 'package:neoplay/presentation/widgets/login_register_toggle.dart';

class Enter extends StatefulWidget {
  const Enter({super.key});

  @override
  State<Enter> createState() => _EnterState();
}

class _EnterState extends State<Enter> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final FocusNode _focusToggle1 = FocusNode();
  final FocusNode _focusToggle2 = FocusNode();

  void _onToggle(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusToggle1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // AppBarni yashirish
      ),
      body: CustomBackground(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 45.sp),
              width: 420.sp,
              child: FocusTraversalGroup(
                child: Column(
                  children: [
                    LoginRegisterToggle(
                      onToggle: _onToggle,
                      text1: 'Kirish',
                      text2: 'Ro’yxatdan o’tish',
                      focusToggle1: _focusToggle1,
                      focusToggle2: _focusToggle2,
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    Expanded(
                      child: _currentIndex == 0
                          ? LogIn()
                          : SignUp(),
                    ),
                  ],
                ),
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
}
