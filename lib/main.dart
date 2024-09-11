import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/access%20_via%20_qr%20_code.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/enter.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/language_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  int _focusedIndex = 0;

  final ScrollController _scrollController = ScrollController();
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          _scrollToIndex(i);
        }
      });
    }
  }

  void _scrollToIndex(int index) {
    final position = index * 320.0; // Har bir elementning balandligi
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            darkTheme: ThemeData(
              useMaterial3: true, // Material 3 ni yoqish
              colorScheme: ColorScheme.dark(
                brightness: Brightness.dark,
              ),
            ),
            theme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: const Enter(),
            routes: {
              LanguageSelection.id: (context) => const LanguageSelection(),
              AccesViaQrCode.id: (context) => const AccesViaQrCode(),
            },
          ),
        );
      },
    );
  }
}
