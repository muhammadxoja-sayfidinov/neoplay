import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/widgets/custom_enter_button.dart';

import 'package:neoplay/presentation/widgets/login_register_toggle.dart';

class Enter extends StatefulWidget {
  const Enter({super.key});

  @override
  State<Enter> createState() => _EnterState();
}

class _EnterState extends State<Enter> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  void _onToggle(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // Hide AppBar
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Log_in.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 87.sp,horizontal: 120.sp),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.4),
                Colors.black.withOpacity(.0),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(
               margin: EdgeInsets.only(top:45.sp ),
               width: 420.sp,
               child: Column(
                 children: [
                   LoginRegisterToggle(
                     onToggle: _onToggle,
                     text1: 'Kirish',
                     text2: 'Ro’yxatdan o’tish',
                   ),
                   Expanded(
                     child: _currentIndex == 0
                         ?Column(
                       children: [
                         CustomEnterButton(svg: "assets/images/qr_logo.svg", text: "QR kod orqali kirish", onPressed: (){})
                       ],
                     ) // Your login form widget
                         : Text("register") // Your registration form widget
                   ),
                 ],
               ),
             ),

             Container(
               width: 390.sp,
               child:  Image(image: AssetImage('assets/images/Logo.png')),
             )
            ],
          ),
        ),
      ),
    );
  }
}
