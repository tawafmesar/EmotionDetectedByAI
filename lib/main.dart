import 'package:emotiondetectedbyai/bindings/intialbindings.dart';
import 'package:emotiondetectedbyai/core/localization/changelocal.dart';
import 'package:emotiondetectedbyai/core/localization/translation.dart';
import 'package:emotiondetectedbyai/core/services/services.dart';
import 'package:emotiondetectedbyai/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      title: 'Secure Tech',
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding:initialBindings() ,
      initialRoute: "splash",
      getPages: routes,
    );
  }
}
