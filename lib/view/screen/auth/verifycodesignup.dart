import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth/verfiycodesignup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/LogoAuth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller =
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          'To Confirm Account',
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
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataViewRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: ListView(
              children: [
                const LogoAuth(),
                const SizedBox(height: 20),
                const CustomTextTitleAuth(text: "Verification Code"),
                const SizedBox(height: 10),
                const CustomTextBodyAuth(
                  text:
                  "Please enter the verification code that was sent to your email",
                ),
                const SizedBox(height: 15),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // Handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    controller.goToSuccessSignUp(verificationCode);
                  },
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    controller.reSend();
                  },
                  child: Center(
                    child: Text(
                      "Resend Verification Code",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
