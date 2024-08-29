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

  // FocusNode larni e'lon qilish
  final List<FocusNode> ageFocusNodes = List.generate(4, (_) => FocusNode());
  final FocusNode saveButtonFocusNode = FocusNode();

  @override
  void dispose() {
    // FocusNode larni tozalash
    for (var node in ageFocusNodes) {
      node.dispose();
    }
    saveButtonFocusNode.dispose();
    super.dispose();
  }

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
                    children: [3, 6, 9, 12].asMap().entries.map((entry) {
                      int index = entry.key;
                      int age = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAge = age;
                          });
                        },
                        child: Focus(
                          focusNode: ageFocusNodes[index], // Fokusni qo'shish
                          child: Container(
                            width: 72.w,
                            height: 72.w,
                            decoration: BoxDecoration(
                              color: grey,
                              border: Border.all(
                                color: selectedAge == age ? Colors.red : Colors.transparent,
                                width: 4.w,
                              ),
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            child: Center(
                              child: Text(
                                '$age',
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 32.h),
                  CustomButton(
                    color: red,
                    width: double.infinity,
                    name: "O'zgarishlarni saqlash",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessfullyRegistered()),
                      );
                    },
                    focusNode: saveButtonFocusNode, // Fokusni qo'shish
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
