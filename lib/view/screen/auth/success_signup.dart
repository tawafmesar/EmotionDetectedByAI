import 'package:flutter/material.dart';
import '../../../controller/auth/successsignup_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          'Success',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: AppColor.clockBG,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "Congratulations",
              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 30),
            ),
            Text("Account created successfully"),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "Go to Sign In",
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
