import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/data/provider/TodoProvider.dart';
import 'app/handler/notification_handler.dart';
import 'app/modules/home/Controllers/auth_controller.dart';
import 'app/modules/home/controllers/authentication_controller.dart';
import 'app/modules/home/views/Navbar.dart';
import 'app/modules/home/views/home_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize GetX controllers and dependencies
  Get.put(AuthenticationController());
  await Get.putAsync(() async => await SharedPreferences.getInstance());

  // Initialize Firebase Messaging
  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $fcmToken');

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),

      ],
      child: GetMaterialApp(
        title: 'Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: _authController.isLoggedIn.value ? '/home' : '/login',
        getPages: [
          GetPage(name: '/login', page: () => const HomeView()),
          GetPage(
            name: '/home',
            page: () => Navbar(),
          ),
        ],
      ),
    );
  }
}
