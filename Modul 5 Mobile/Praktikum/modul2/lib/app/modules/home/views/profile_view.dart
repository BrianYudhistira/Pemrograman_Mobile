import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/Database/StorageController.dart';
import '../../Theme/colors.dart';
import '../Controllers/auth_controller.dart';
import '../controllers/authentication_controller.dart';
import '../controllers/profile_controller.dart';
import 'WebViewPage.dart';

class ProfileView extends GetView<ProfileController> {
  final AuthenticationController imageController =
      Get.find<AuthenticationController>();
  final AuthController _authController = Get.put(AuthController());
  final StorageController storageController = Get.put(StorageController());

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    storageController.getImage();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 60, right: 60),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                ),
              ),
            ),
            Container(
              height: 270,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Column(
                              children: [
                                Text(
                                  "Brian Yudhistira",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey[900],
                                  ),
                                ),
                                const Text(
                                  "afifraihan59@gmail.com",
                                  // Add the email text here
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              color: Colors.transparent,
                              height: 40,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      color: Colors.transparent,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await imageController
                                              .getImageFromGallery();
                                          await storageController.deleteOldProfileImage();
                                          await storageController.storeImage(imageController.image.value!);
                                          await storageController.getImage();

                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey[700],
                                        ),
                                        child: const Text("Upload Gallery", style: TextStyle(color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 42),
                                    child: Container(
                                      color: Colors.transparent,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await imageController
                                              .getImageFromCamera();
                                          await storageController
                                              .deleteOldProfileImage();
                                          await storageController
                                              .storeImage(imageController.image.value!);
                                          await storageController.getImage();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey[700],
                                        ),
                                        child: const Text("Upload Camera", style: TextStyle(color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Obx(() {
                      // Call getImage to ensure imageData.value is updated
                      final image = storageController.imageData.value;
                      return image != null
                          ? Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: MemoryImage(image),
                          ),
                        ),
                      )
                          : Container(
                        width: 150,
                        height: 150,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // Set your desired button color
                    borderRadius:
                        BorderRadius.circular(10), // Set the border radius
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.notifications, color: primaryColor, size: 35),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          "Notifcations",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // Set your desired button color
                    borderRadius:
                        BorderRadius.circular(10), // Set the border radius
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.settings, color: primaryColor, size: 35),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          "Settings",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const WebViewPage();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // Set your desired button color
                    borderRadius:
                        BorderRadius.circular(10), // Set the border radius
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.help_outline, color: primaryColor, size: 35),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          "Help Center",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  _authController.logout();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // Set your desired button color
                    borderRadius:
                        BorderRadius.circular(10), // Set the border radius
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: primaryColor, size: 35),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          "Log Out",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
