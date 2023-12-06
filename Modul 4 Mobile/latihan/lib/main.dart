import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/Pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controllers/auth_controller.dart';
import 'Pages/home_page.dart';
import 'Pages/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthController _authController =
      Get.put(AuthController()); // Buat instance AuthController
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: _authController.isLoggedIn.value ? '/home' : '/login',
      // Set initial route based onlogin status
      getPages: [
        GetPage(name: '/login', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage())
      ],
    );
  }
}
