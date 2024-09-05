import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final FocusNode contentFocusNode = FocusNode();

  void _onToggle(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusToggle1.requestFocus(); // Set initial focus to the first toggle
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // Hide the AppBar
      ),
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowLeft):
          const _ToggleIntent(Direction.left),
          LogicalKeySet(LogicalKeyboardKey.arrowRight):
          const _ToggleIntent(Direction.right),
          LogicalKeySet(LogicalKeyboardKey.select): const _ActivateIntent(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            _ToggleIntent: CallbackAction<_ToggleIntent>(
              onInvoke: (intent) => _handleToggle(intent.direction),
            ),
            _ActivateIntent: CallbackAction<_ActivateIntent>(
              onInvoke: (intent) => _toggleActivate(),
            ),
          },
          child: CustomBackground(
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 45.sp),
                  width: 420.sp,
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

                          child: _currentIndex == 0 ? const LogIn() : const SignUp(),
                        ),

                    ],
                  ),
                ),
                Container(
                  width: 390.sp,
                  child: const Image(image: AssetImage('assets/images/Logo.png')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleToggle(Direction direction) {
    if (direction == Direction.right && _focusToggle1.hasFocus ) {
      setState(() {
        _focusToggle2.requestFocus();
      });

    } else if (direction == Direction.left &&  _focusToggle2.hasFocus ) {
      setState(() {
        _focusToggle1.requestFocus();
      });

    }
  }

  void _toggleActivate() {
   if( _focusToggle2.hasFocus){
     setState(() {
       _onToggle(1);
     });
   }


   if(_focusToggle1.hasFocus){
     setState(() {
       _onToggle(0);
     });
   }
  }
}

enum Direction { left, right }

class _ToggleIntent extends Intent {
  const _ToggleIntent(this.direction);
  final Direction direction;
}

class _ActivateIntent extends Intent {
  const _ActivateIntent();
}
