import 'package:emotiondetectedbyai/controller/fromgalary_controller.dart';
import 'package:emotiondetectedbyai/core/constant/color.dart';
import 'package:emotiondetectedbyai/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class FromGalaryScan extends StatelessWidget {
  const FromGalaryScan({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FromGalaryController());
    
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'From Gallery',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.4,
              fontFamily: 'SofiaSans',
              fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {

            Get.offAllNamed(AppRoute.homescreen);

          },
        ),
      ),
      body:GetBuilder<FromGalaryController>(
        init: FromGalaryController(),
    builder:(controller) {
      return Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: AppColor.splsh2,
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                  borderRadius:
                  BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      12.0),
                  child:  controller.fileimage != null ? Image.file(
                    controller.fileimage!,
                    fit: BoxFit.cover,
                  ) : Image.asset(
                    'assets/images/upload.png', // Provide path to placeholder image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              controller.label != '' ?    "Result: ${controller.label!}"  : 'Result:-----',

              style: const TextStyle(
                  fontSize: 28,
                  fontFamily: 'SofiaSans',
                  fontWeight: FontWeight.bold),
            ),
            // Text(
            //   'Probability: ${(probability * 100).toStringAsFixed(2)}%',
            //   style: const TextStyle(fontSize: 20),
            // ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {

                 controller.pickImageFromGallery();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                alignment: Alignment.center,
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                decoration: BoxDecoration(
                  color:AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Pick Image',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ),
            ),
          ],
        ),
      );
    }),
    );
  }
}
