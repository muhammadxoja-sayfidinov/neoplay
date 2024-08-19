import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/successfully_registered.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

class GetChildrenAge extends StatefulWidget {
  const GetChildrenAge({super.key});

  @override
  State<GetChildrenAge> createState() => _GetChildrenAgeState();
}

class _GetChildrenAgeState extends State<GetChildrenAge> {
  int selectedAge = 12; // Default selected age

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/kids-update-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500.w,
              padding: EdgeInsets.all(48.w),
              decoration: BoxDecoration(
                color: Color.fromRGBO(13, 14, 16, 1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bola necha yoshda?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [3, 6, 9, 12].map((age) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAge = age;
                          });
                        },
                        child: Container(
                          width: 72.w,
                          height: 72.w,
                          decoration: BoxDecoration(
                            color: grey,
                           
                            border: Border.all(
                              color: selectedAge == age ? Colors.red : Colors.transparent,
                              width: 4.w,
                            ),
                            borderRadius: BorderRadius.circular(32.r)
                          ),
                          child: Center(
                            child: Text(
                              '$age',
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color:  Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 32.h),

                  CustomButton(color: red, width: double.infinity, name: "O'zgarishlarni saqlash", onPressed: (){
                    var push = Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessfullyRegistered()),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
