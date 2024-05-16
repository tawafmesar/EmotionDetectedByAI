import 'package:camera/camera.dart';
import 'package:emotiondetectedbyai/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder:(controller){
        return controller.isCameraInitialized.value
            ? Stack(
          children: [
            CameraPreview(controller.cameraController),
            Center(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                        color: Colors.green,
                        width: 4.0
                    )
                ),
                child: Column(
                  children:  [
                    Container(
                        color:Colors.white,
                        child: Text("${controller.label}")
                    ),
                  ],
                ),
              ),
            )
          ],
        )
             : const Center(
          child: Text("Loading Preview ...."),
        );

        }
      ),
    );
  }
}
