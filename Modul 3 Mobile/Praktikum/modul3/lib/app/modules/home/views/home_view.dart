import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul2/app/modules/home/views/login_page.dart';
import 'package:modul2/app/modules/home/views/register_page.dart';

import '../Components/button.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 25,
              ),

              //shop name
              Text(
                "SUSHI MAN",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28, color: Colors.white),
              ),

              const SizedBox(height: 25),
              //icon
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('assets/images/salmon.png'),
              ),

              const SizedBox(height: 25),

              Text(
                "THE TASTE OF JAPANESE FOOD",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 44, color: Colors.white),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                "Feel the taste of the most popular Japanese food from anywhere and anytime",
                style: TextStyle(
                  color: Colors.grey[200],
                  height: 2,
                ),
              ),

              const SizedBox(height: 10),

              MyButton(
                text: "Register",
                onTap: () {
                  //go to menu
                  Get.to(() => RegisterPage());
                }
              ),
              const SizedBox(height: 10),

              MyButton(
                  text: "Login",
                  onTap: () {
                    //go to menu
                    Get.to(() => LoginPage());
                  }
              )
            ]),
      ),
    );
  }
}
