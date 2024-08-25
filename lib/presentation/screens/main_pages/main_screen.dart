import 'package:flutter/material.dart';

import '../../../core/constants/style.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Avval ko’rilganlar',
            style: CustomTextStyle.style600,
          )
        ],
      ),
    );
  }
}
