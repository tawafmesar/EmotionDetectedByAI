import 'package:emotiondetectedbyai/core/class/statusrequest.dart';
import 'package:emotiondetectedbyai/core/constant/routes.dart';
import 'package:emotiondetectedbyai/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';


abstract class HomeScreenController extends GetxController {
}

class HomeScreenControllerrImp extends HomeScreenController {



  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? user_name;


  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
  GlobalKey<SliderDrawerState>();
  late String title;




  @override
  void onInit() {

    user_name = "Hello " + myServices.sharedPreferences.getString("username")!;

    super.onInit();
  }
  @override
  void dispose() {

    super.dispose();
  }


  @override
  logout() async {

    myServices.sharedPreferences.setString("step","1") ;
    await Future.delayed(Duration.zero);
    Get.offNamed(AppRoute.login);
  }

}