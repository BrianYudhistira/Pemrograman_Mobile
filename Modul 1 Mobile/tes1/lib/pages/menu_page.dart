import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tes1/Components/button.dart';
import 'package:tes1/Components/food_tile.dart';
import 'package:tes1/Models/food.dart';
import 'package:tes1/Theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

void _navigateToProfilePage(BuildContext context) {
  Navigator.of(context).pushNamed('/profile'); // Navigate to the profile page
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu = [
    //salmon sushi
    Food(
        name: "Salmon Sushi",
        price: "20.00",
        imagePath: "assets/images/nigiri.png",
        rating: "4.9"),

    //tuna
    Food(
        name: "Tuna ",
        price: "15.00",
        imagePath: "assets/images/sushi-roll.png",
        rating: "4.5"),

    Food(
        name: "Uramaki",
        price: "17.00",
        imagePath: "assets/images/uramaki.png",
        rating: "4.5"),

    Food(
        name: "Special_Sushi",
        price: "20.00",
        imagePath: "assets/images/salmon (1).png",
        rating: "4.5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text('SushiMan', style: TextStyle(color: Colors.grey[900])),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            iconSize: 30,
            onPressed: () {
              _navigateToProfilePage(context);
            },
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //promo banner
        Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //promo message
                  Text(
                    "Get 50% Promo",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20, color: Colors.white),
                  ),

                  const SizedBox(height: 20),

                  //redeem button
                  MyButton(text: "Redeem", onTap: () {})
                ],
              ),
              Image.asset(
                'assets/images/sushi.png',
                height: 100,
              )
            ],
          ),
        ),

        const SizedBox(height: 25),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25))),
          ),
        ),
        const SizedBox(height: 25),

        //menu list
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Food Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              fontSize: 18,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodMenu.length,
          itemBuilder: (context, index) => FoodTile(food: foodMenu[index]),
        )),

        const SizedBox(height: 25),

        //popular food
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                //image
                Image.asset(
                  'assets/images/gunkan.png',
                  height: 50,
                ),

                //name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name
                    Text(
                      "Salmon Eggs",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      '\$21.00',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
              ],
            ),

            //heart
            const Icon(Icons.favorite_outline, color: Colors.grey, size: 28)
          ]),
        )
      ]),
    );
  }
}
