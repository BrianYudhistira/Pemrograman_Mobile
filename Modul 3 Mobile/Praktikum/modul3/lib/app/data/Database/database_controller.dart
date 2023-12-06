import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul2/app/data/Database/ClientController.dart';
import 'package:modul2/app/modules/home/Models/Todo_model.dart';

class DatabaseController extends ClientController {
  DatabaseController._privateConstrucor();

  static final DatabaseController _instace = DatabaseController
      ._privateConstrucor();

  static DatabaseController get instance => _instace;
  Databases? databases;

  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
  }

  CreateTodo({
    required String title,
    required String description,
  }) async {
    databases ?? onInit();
    try {
      await databases!.createDocument(
        databaseId: "6566a7902ad9df7cf699",
        documentId: ID.unique(),
        collectionId: "656f4a8d1d9a0b92bb4c",
        data: {
          "title": title,
          "description": description,
          "isDone": false,
          "CreatedAT": DateTime.now().toIso8601String(),
          "ID": 1
        },
      );
      print("DatabaseController:: storeUserName $databases");
      return true;
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  getTodos() async {
    databases ?? onInit();
    try {
      DocumentList response = await databases!.listDocuments(
        databaseId: "6566a7902ad9df7cf699",
        collectionId: "656f4a8d1d9a0b92bb4c",
        queries: [
          Query.equal("ID", 1)
        ],
      );
      return response.documents.map((e) => TodoModel.fromJson(e.data, e.$id))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  updateTodo(TodoModel todo) async {
    databases ?? onInit();
    try {
      await databases!.updateDocument(
        databaseId: "6566a7902ad9df7cf699",
        collectionId: "656f4a8d1d9a0b92bb4c",
        documentId: todo.id,
        data: {
          "title": todo.title,
          "description": todo.description,
          "isDone": todo.isDone,
          "CreatedAT": todo.createAT.toIso8601String(),
          "ID": 1,
        },
      );
    } catch (e) {
      rethrow;
    }
  }


  void deleteTodo(String id) async {
    databases ?? onInit();
    try {
      await databases!.deleteDocument(databaseId: "6566a7902ad9df7cf699",
          collectionId: "656f4a8d1d9a0b92bb4c",
          documentId: id);
    }catch (e) {
      rethrow;
    }
  }
}


