import 'dart:developer' as developer;

import 'package:camera/camera.dart';
import 'package:emotiondetectedbyai/core/class/statusrequest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';




import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'dart:math';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';


class FromGalaryController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    super.onInit();
    initTFlite();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var x , y ,w , h = 0.0;

  var label = "";


  late File? fileimage = null; // Initialize to null
  dynamic _probability = 0;
  String? _result;

  final picker = ImagePicker();



  initTFlite() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
  }


  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery);
    if (pickedFile != null) {
      _setImage(File(pickedFile.path));
    }
    objectDetector();
    update(); // Notify UI about the change


  }

  void _setImage(File image) {
      fileimage = image;

  }

  objectDetector() async {
    if (fileimage != null) {
      var recognitions = await Tflite.runModelOnImage(
        path: fileimage!.path, // Use the path property to get the path of the file
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true,
      );

      if (recognitions != null) {
        label = recognitions.first['label'].toString();
        developer.log(" detectedClass is $label");
        update();
      }
    }
  }



}
