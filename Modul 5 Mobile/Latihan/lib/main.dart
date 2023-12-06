import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/ui/Tes.dart';

import 'Controller/ClientController.dart';
import 'Controller/StorageController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize and register your controllers
  Get.put(ClientController());
  Get.put(StorageController());

  runApp(
    GetMaterialApp(
      home: Tes(),
    ),
  );
}