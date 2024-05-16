import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 470,
      child: Image.asset(
        'assets/images/gruplogo.png',
        fit: BoxFit.contain, // You can choose the appropriate fit based on your needs
      ),
    );
  }
}