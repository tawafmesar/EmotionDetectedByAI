import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4400), () {
      Get.find<LocaleController>().changeLang("en");
      Get.offNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor, // Set the background color to black
      body: Center(

        child: Container(
            color: const Color.fromRGBO(0, 74, 173, 1),
            child: Image.asset('assets/images/logowhite.png')),
      ),
    );
  }
}

