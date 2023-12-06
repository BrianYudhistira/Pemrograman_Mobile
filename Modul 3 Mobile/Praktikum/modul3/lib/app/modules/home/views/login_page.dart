import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      appBar: AppBar(
        title: Text('Login', style: GoogleFonts.dmSerifDisplay(
            fontSize: 23, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 138, 60, 55),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              // Add an Image widget above the text fields
              Image.asset(
                'assets/images/sushi-roll.png', // Replace with the actual path to your image
                height: 200,
                width: 400, // Adjust the height as needed
              ),
              SizedBox(height: 110),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white), // Set label color to white
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set border color to white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set focused border color to white
                  ),
                ),
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
              SizedBox(height: 25),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white), // Set label color to white
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set border color to white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white), // Set focused border color to white
                  ),
                ),
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
              SizedBox(height: 30),
              Obx(() {
                return Container(
                  width: double.infinity, // Set width to maximum
                  child: ElevatedButton(
                    onPressed: _authController.isLoading.value
                        ? null
                        : () {
                      _authController.loginUser(
                        _emailController.text,
                        _passwordController.text,
                      );
                    },
                    child: _authController.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('Login'),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
