import 'package:emotiondetectedbyai/core/class/statusrequest.dart';
import 'package:emotiondetectedbyai/core/constant/routes.dart';
import 'package:emotiondetectedbyai/core/functions/handingdatacontroller.dart';
import 'package:emotiondetectedbyai/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../data/datasource/remote/auth/signup.dart';
abstract class ProfileController extends GetxController {

}

class ProfileControllerImp extends ProfileController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  String? userid;
  String? oldusername;
  String? oldemail;
  String? oldphone;
  String? oldpassword;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());
  MyServices myServices = Get.find();

  List data = [];




  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  updatedata() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await signupData.postupdatedata(userid!,
          username.text, password.text, email.text, phone.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          updatelocaldata(username.text,password.text, phone.text);
          Get.offNamed(AppRoute.homepage);
        } else {
          Get.defaultDialog(title: "Alert", middleText: "Sorry, The email or phone number already exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }

  }

  @override
  void onInit() {
    username = TextEditingController() ;
    phone = TextEditingController() ;
    email = TextEditingController();
    password = TextEditingController();



    userid = myServices.sharedPreferences.getString("id") ;
    oldusername = myServices.sharedPreferences.getString("username") ;
    oldemail = myServices.sharedPreferences.getString("email") ;
    oldphone = myServices.sharedPreferences.getString("phone") ;


    username = TextEditingController(text: oldusername ?? "");
    email = TextEditingController(text: oldemail ?? "");

    phone = TextEditingController(text: oldphone ?? "");



    super.onInit();
  }

  @override
  updatelocaldata(String username, String password ,  String phone) async {

    myServices.sharedPreferences
        .setString("username", username);
    myServices.sharedPreferences
        .setString("password", password);
    myServices.sharedPreferences
        .setString("phone", phone);

    update();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}