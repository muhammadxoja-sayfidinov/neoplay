import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neoplay/presentation/screens/Login%20and%20registration/verification_code_page.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});


  @override
  State<SignUp> createState() => _SignUpState();
}
  class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
    void _handleSubmitted(String value, FocusNode nextFocusNode) {
        if(phoneFocusNode.hasFocus){
              passwordFocusNode.requestFocus();
        }else if(passwordFocusNode.hasFocus){
              confirmPasswordFocusNode.requestFocus();
        }else if(confirmPasswordFocusNode.hasFocus){
            signUpButtonFocusNode.requestFocus();
        }
    }
    final FocusNode phoneFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();
    final FocusNode confirmPasswordFocusNode = FocusNode();
    final FocusNode signUpButtonFocusNode = FocusNode();

    Widget build(BuildContext context) {
      return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowDown): const _ToggleIntent(
              Direction.down),
          LogicalKeySet(LogicalKeyboardKey.arrowUp): const _ToggleIntent(
              Direction.up),
          LogicalKeySet(LogicalKeyboardKey.tvNumberEntry): const _ToggleIntent(
              Direction.enter),

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
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Telefon raqam yoki pochtani kiriting",
                  style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
                ),
                20.h.verticalSpace,
                CustomTextField(
                  hintText: '+998',
                  nextFocusNode: passwordFocusNode,
                  keyboardType: TextInputType.phone,
                  focusNode: phoneFocusNode, // FocusNode qo'shildi
                ),
                48.h.verticalSpace,
                Text(
                  "Parol yarating",
                  style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
                ),
                20.h.verticalSpace,
                CustomTextField(
                  hintText: '',
                  nextFocusNode: confirmPasswordFocusNode,
                  obscureText: true,
                  focusNode: passwordFocusNode, // FocusNode qo'shildi
                ),
                20.h.verticalSpace,
                Text(
                  "Parolni takrorlang",
                  style: CustomTextStyle.style400.copyWith(fontSize: 24.sp),
                ),
                20.h.verticalSpace,
                CustomTextField(
                  hintText: '',
                  obscureText: true,
                  nextFocusNode: signUpButtonFocusNode,

                  focusNode: confirmPasswordFocusNode, // FocusNode qo'shildi
                ),
                32.h.verticalSpace,
                CustomButton(
                  color: lightGrey,
                  width: 420.w,
                  name: "Kirish",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerificationCodePage()),
                    );
                  },
                  focusNode: signUpButtonFocusNode, // FocusNode qo'shildi
                ),
              ],
            ),
          ),
        ),
      );
    }

    void _handleToggle(Direction direction) {
      if (direction == Direction.down) {
        if (phoneFocusNode.hasFocus) {
          passwordFocusNode.requestFocus();
        } else if (passwordFocusNode.hasFocus) {
          confirmPasswordFocusNode.requestFocus();
        } else if (confirmPasswordFocusNode.hasFocus) {
          signUpButtonFocusNode.requestFocus();
        }
      } else if (direction == Direction.up) {
        if (signUpButtonFocusNode.hasFocus) {
          confirmPasswordFocusNode.requestFocus();
        } else if (confirmPasswordFocusNode.hasFocus) {
          passwordFocusNode.requestFocus();
        } else if (passwordFocusNode.hasFocus) {
          phoneFocusNode.requestFocus();
        } else if (phoneFocusNode.hasFocus) {
          FocusScope.of(context).previousFocus();
        }
      }
    }

    void _toggleActivate() {
     if (signUpButtonFocusNode.hasFocus) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerificationCodePage()),
        );
      }
    }

  }

enum Direction { up, down,enter ,  }

class _ToggleIntent extends Intent {
  const _ToggleIntent(this.direction);
  final Direction direction;
}

class _ActivateIntent extends Intent {
  const _ActivateIntent();
}