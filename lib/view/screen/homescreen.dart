
import 'package:emotiondetectedbyai/core/constant/color.dart';
import 'package:emotiondetectedbyai/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'dart:math';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  late File _image;
  dynamic _probability = 0;
  String? _result;
  List<String>? _labels;
  var label = "";

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: const Text(
              'Emoion Detected By AI',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                  fontFamily: 'SofiaSans',
                  fontSize: 20),
            ),

          ),
          backgroundColor: Colors.blueAccent,
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 80),

                  const SizedBox(height: 50),
                  Center(
                      child: SizedBox(
                        width: 350,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/face.png'),
                            const SizedBox(height: 50),
                          ],
                        ),
                      )

                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.offNamed(AppRoute.CameraView);

                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 18),
                              decoration: BoxDecoration(
                                color:AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Open Camera',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SofiaSans'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: GestureDetector(

                            onTap: () {
                                 Get.offAllNamed(AppRoute.fromGalaryScan);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 18),
                              decoration: BoxDecoration(
                                color:AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'Select a photo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SofiaSans'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        )
    );
  }

}
