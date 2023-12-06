import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul2/app/modules/home/controllers/authentication_controller.dart';

import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthenticationController());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}