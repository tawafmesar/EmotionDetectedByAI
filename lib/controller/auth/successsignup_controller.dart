import 'package:get/get.dart';

import '../../core/constant/routes.dart';


abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {


  late String email;
  late String password;

  @override
  goToPageLogin() {

    print('email ........$email');
    print('password ........$password');

    Get.offNamed(AppRoute.login  ,arguments: {
      "emailinit" : email,
      "passwordinit" : password
    });

  }



  @override
  void onInit() {

    Map<String, dynamic> args = Get.arguments;
     email = args["emailinit"];
     password = args["passwordinit"];



    super.onInit();
  }
}