import 'package:flutter/material.dart';
import 'package:neoplay/core/constants/colors.dart';
import 'package:neoplay/core/constants/style.dart';
import 'package:neoplay/presentation/widgets/custom_button.dart';

class LanguageSelection extends StatefulWidget {
  static final String id = "language_selection";
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Тилни танланг / Выбор языка" , style: CustomTextStyle.style600,),
                SizedBox(
                  height: 64,
                ),
                CustomButton(color: red, width: 416, name: 'Ўзбек тили (крилл)', onPressed: (){}),
                SizedBox(
                  height: 24,
                ),
                CustomButton(color: grey, width: 416, name: 'O’zbek tili (lotin)  ', onPressed: (){}),
                SizedBox(
                  height: 24,
                ),
                CustomButton(color: grey, width: 416, name: 'Русский', onPressed: (){}),
              ],
            ),
          ),
    );
  }
}
