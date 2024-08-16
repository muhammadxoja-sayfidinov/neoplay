import 'package:flutter/material.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/enter.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/language_selection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: Enter(),
          routes: {
            LanguageSelection.id: (context) => const LanguageSelection(),
          },
        );
      },
    );
  }
}
