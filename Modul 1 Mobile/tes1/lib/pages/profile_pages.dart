import 'package:flutter/material.dart';
import 'package:tes1/Theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My Profile', style: TextStyle(color: Colors.grey[900])),
        iconTheme: IconThemeData(
          color: Colors.grey[900], // Change the color of the back arrow
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image:
                              AssetImage("assets/images/profile_avatar.png"))),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[400]),
                        child: const Icon(Icons.add_a_photo,
                            color: Colors.black, size: 20))),
              ],
            ),
            const SizedBox(height: 10),
            Text("Brian Yudhistira",
                style: TextStyle(
                    fontSize: 20, color: Colors.grey[900])),
            Text("brianyudhistira1@gmail.com",
                style: TextStyle(
                    fontSize: 14, color: Colors.grey[800])),
            const Divider(),
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
                      Icon(Icons.person, color: primaryColor, size: 35),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          "My Account",
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
            ), Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: GestureDetector(
                onTap: () {
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100], // Set your desired button color
                    borderRadius: BorderRadius.circular(10), // Set the border radius
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
            )
          ]),
        ),
      ),
    );
  }
}
