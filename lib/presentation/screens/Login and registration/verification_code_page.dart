import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/get_birthday.dart';
import 'package:neoplay/presentation/widgets/Custom_background.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

class VerificationCodePage extends StatefulWidget {
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final FocusNode _submitButtonFocusNode = FocusNode();
  final FocusNode _focusScope =FocusNode();

  bool _showError = false;
  @override
  void initState() {
    super.initState();
    if (_focusNodes.isNotEmpty) {
      _focusNodes[0].requestFocus();
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowDown): const _ToggleIntent(Direction.down),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const _ToggleIntent(Direction.up),
        LogicalKeySet(LogicalKeyboardKey.tvNumberEntry): const _ToggleIntent(Direction.enter),

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
        child: Scaffold(
          body: CustomBackground(
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 680.sp,
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ro'yxatdan o'tishni tasdiqlang",
                        style: CustomTextStyle.style600.copyWith(fontSize: 38.sp),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Raqamingiz yoki pochtangizga tasdiqlash kodini yubordik, iltimos, ushbu kodni kiriting',
                        style: CustomTextStyle.style400
                            .copyWith(color: Colors.white, fontSize: 28.sp),
                      ),
                      SizedBox(height: 24.h),
                      Form(

                        key: _formKey,
                        child: Focus(
                          focusNode: _focusScope,
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(6, (index) {
                              return Padding(
                                padding: EdgeInsets.all(4.w),
                                child: _buildCodeField(
                                    _controllers[index], _focusNodes[index], index),
                              );
                            }),
                          ),
                        ),
                      ),
                      if (_showError) ...[
                        SizedBox(height: 6.h),
                        Text(
                          'Kod xato yoki to’liq kiritilmagan!',
                          style: CustomTextStyle.style400
                              .copyWith(fontSize: 24.sp, color: red),
                        ),
                      ],
                      SizedBox(height: 24.h),
                      CustomButton(
                        onPressed: _validateInputs,
                        name: 'Tasdiqlash',
                        width: double.infinity,
                        color:_submitButtonFocusNode.hasFocus ? red : lightGrey,
                        focusNode: _submitButtonFocusNode,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Siz 59 soniyadandan so'ng kodni qayta so'rashingiz mumkin",
                        style: CustomTextStyle.style400.copyWith(
                          color: Colors.white,
                          fontSize: 28.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 390.sp,
                  child: Image(image: AssetImage('assets/images/Logo.png')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeField(TextEditingController controller, FocusNode focusNode, int index) {
    return Container(
      width: 72.w, // Square input field
      height: 72.w, // Square input field
      padding: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: focusNode.hasFocus
              ? Colors.white // Change border color to white when focused
              : controller.text.isEmpty && _showError
              ? Colors.red
              : grey,
          width: 2.0,
        ),
        color: grey,
      ),
      child: TextFormField(

        controller: controller,
        focusNode: focusNode,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.sp,
        ),
        textAlign: TextAlign.center, // Center text horizontally
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onSaved: (value){
          _submitButtonFocusNode.requestFocus();
        },
        onChanged: (value) {
          setState(() {
            _showError = false;
          });
          if (value.isNotEmpty) {
            if (index < _focusNodes.length - 1) {
              _focusNodes[index + 1].requestFocus();
            } else {
              _focusNodes[index].unfocus();
              FocusScope.of(context).requestFocus(_submitButtonFocusNode);
            }
          } else if (value.isEmpty ) {
            _focusNodes[index ].requestFocus();
          }
        },
      ),
    );
  }
  void _handleToggle(Direction direction) {
      if(direction == Direction.down){
          if(_focusScope.hasFocus){
            _submitButtonFocusNode.requestFocus();
          }
      }
  }


  void _toggleActivate() {
      if(_submitButtonFocusNode.hasFocus){

        setState(() {
          _validateInputs();
        });

      }
  }
  void _validateInputs() {
    setState(() {
      _showError = _controllers.any((controller) => controller.text.isEmpty);
    });

    if (!_showError) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GetBirthday()),
      );
    } else {
      _controllers.forEach((controller) => controller.clear());
      if (_focusNodes.isNotEmpty) {
        _focusNodes[0].requestFocus();
      }
    }
  }

}


enum Direction { up, down,enter }

class _ToggleIntent extends Intent {
  const _ToggleIntent(this.direction);
  final Direction direction;
}

class _ActivateIntent extends Intent {
  const _ActivateIntent();
}
