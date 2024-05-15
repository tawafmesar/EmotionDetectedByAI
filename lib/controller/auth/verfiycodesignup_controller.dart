import 'package:emotiondetectedbyai/core/class/statusrequest.dart';
import 'package:emotiondetectedbyai/core/constant/routes.dart';
import 'package:emotiondetectedbyai/core/functions/handingdatacontroller.dart';
import 'package:emotiondetectedbyai/data/datasource/remote/auth/verfiycodesignup.dart';
import 'package:get/get.dart';



abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());


  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(email!, verfiyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "تنبيه",
            middleText: "رمز التحقق الذي ادخلته غير صحيح");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  reSend(){
    verfiyCodeSignUpData.resendData(email!);
  }

}