import 'dart:developer' as developer;

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTFlite();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  var x , y ,w , h = 0.0;

  var label = "";

  late CameraController cameraController;
  late List<CameraDescription> cameras;

  var isCameraInitialized = false.obs;
  var cameraCount = 0;

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();

      if (kIsWeb) {
        // Web-specific camera initialization
        cameraController = CameraController(
          cameras[0],
          ResolutionPreset.max,
        );
      } else {
        // Mobile/desktop-specific camera initialization
        cameraController = CameraController(
          cameras[0],
          ResolutionPreset.max,
          enableAudio: false, // Specify platform-specific options
        );
      }

      await cameraController.initialize().then((value) {
        cameraController.startImageStream((image) {
          cameraCount++;
          if (cameraCount % 10 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
          update();
        });
      });
      isCameraInitialized(true);
      update();
    } else {
      print("Permission denied");
    }
  }

  initTFlite() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
  }


    objectDetector(CameraImage image) async {
      var detector = await Tflite.runModelOnFrame(
        bytesList: image.planes.map((plane) {return plane.bytes;}).toList(),
        asynch: true,
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5,
        imageStd: 127.5,
        numResults: 2,
        rotation: 90,
        threshold: 0.1,
      );


      if (detector != null) {


        label = detector.first['label'].toString();



        //
        // developer.log("Result is $detector");

        developer.log(" detectedClass is $label");

        // developer.log(" h is $h");
        // developer.log(" w is $w");
        // developer.log(" x is $x");
        // developer.log(" y is $y");
        //

        update();
    }

  }


}
