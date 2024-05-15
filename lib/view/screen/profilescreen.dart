import 'package:emotiondetectedbyai/controller/profile_controller.dart';
import 'package:emotiondetectedbyai/view/widget/logoappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';


import '../../controller/auth/signup_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/functions/alertexitapp.dart';
import '../../core/functions/validinput.dart';
import '../widget/auth/custombuttonauth.dart';
import '../widget/auth/customtextformauth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {


    Get.put(ProfileControllerImp());
    return Scaffold(
      appBar: LogoAppBar(showBackButton: true,)
        ,
      
      body:  GetBuilder<ProfileControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40),
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.contain, // You can choose the appropriate fit based on your needs
                  ),
                  ),


                  const SizedBox(height: 15),
                    CustonTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 20, "username");
                      },
                      mycontroller: controller.username,
                      hinttext: "Enter your username",
                      iconData: Icons.person_outline,
                      labeltext: "Username",
                    ),
                    Text('The Email Cant be editing',
                      style: const TextStyle(
                          color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    CustonTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 35, "email");
                      },
                      mycontroller: controller.email,
                      hinttext: "Enter your email",
                      iconData: Icons.email_outlined,
                      labeltext: "Email",
                      isreesonly: true,
                    ),
                    CustonTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 2, 19, "phone");
                      },
                      mycontroller: controller.phone,
                      hinttext: "Enter your phone number",
                      iconData: Icons.phone_android_outlined,
                      labeltext: "Phone Number",
                    ),
                    CustonTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 30, "password");
                      },
                      obscureText: true,
                      mycontroller: controller.password,
                      hinttext: "Enter your password",
                      iconData: Icons.lock_outline,
                      labeltext: "Password",
                    ),
                    CustomButtomAuth(
                      text: "Update",
                      onPressed: () {
                        controller.updatedata();
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}
