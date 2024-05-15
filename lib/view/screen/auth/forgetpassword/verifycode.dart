import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/verifycode_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/LogoAuth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text( 'Account Verification',
            style:TextStyle(color:Colors.white,fontSize: 20, fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: AppColor.clockBG,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],)
        ),
      ),
        body:GetBuilder<VerifyCodeControllerImp>(
            builder: (controller)=>

                HandlingDataViewRequest(statusRequest: controller.statusRequest,
                    widget:

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: ListView(children: [
          const LogoAuth(),

          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "Verification Code"),
          const SizedBox(height: 10),
          const CustomTextBodyAuth(
              text: "Please enter the verification code sent to your email",
          ),
          const SizedBox(height: 15),
          OtpTextField(

            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor:const  Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              controller.goToRestPassword(verificationCode);

            }, // end onSubmit
          ),
          const SizedBox(height: 40),
        ]),
      )))
    );
  }
}

