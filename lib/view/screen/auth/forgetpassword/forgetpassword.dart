import 'package:emotiondetectedbyai/view/widget/auth/LogoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          "Forgot Password",
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
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataViewRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  LogoAuth(),
                  CustomTextTitleAuth(text: "Check Email"),
                  const SizedBox(height: 10,),
                  CustomTextBodyAuth(
                    text: "Please enter your email to receive a verification code",
                  ),
                  const SizedBox(height: 15,),
                  CustonTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    mycontroller: controller.email,
                    hinttext: "Enter your email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                  ),
                  CustomButtomAuth(
                    text: "Check",
                    onPressed: () {
                      controller.checkemail();
                    },
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
