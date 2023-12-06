import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul2/app/data/Models/API.dart';
import 'package:modul2/app/modules/home/views/profile_view.dart';
import '../controllers/http_controller.dart';

class List_View extends StatelessWidget {

  final HttpController httpController = Get.put(HttpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileView();
              }));
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Result>>(
        future: httpController.fetchListItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            final items = snapshot.data!;

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildListItemCard(items[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildListItemCard(Result item) {
    return Card(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
            children: [
              Image.network(
                item.image,
                fit: BoxFit.cover,
                height: 300,
                width: 500,
              ),
              ListTile(
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              ),
            ],
        ),
    );}
}