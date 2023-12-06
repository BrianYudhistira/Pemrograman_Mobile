import 'dart:io';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './ClientController.dart';

class StorageController extends ClientController {
  Storage? storage;
  Rx<Uint8List?> imageData = Rx<Uint8List?>(null);

  @override
  void onInit() {
    super.onInit();
    storage = Storage(client);
  }

  Future storeImage(File file) async {
    try {
      final result = await storage!.createFile(
        bucketId: '6566a865a7d852ba72cc',
        fileId: 'profile',
        file: InputFile.fromPath(
          path: file.path,
          filename: 'profile.jpg',
        ),
      );
      print("StorageController:: storeImage $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Storage",
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

  Future<void> deleteOldProfileImage() async {
    try {
      // Hapus gambar profil yang lama, jika ada
      await storage!.deleteFile(
        bucketId: '6566a865a7d852ba72cc',
        fileId: 'profile',
      );
    } catch (error) {
      // Handle error (jika gambar profil lama tidak ada, abaikan saja)
      print("Error in deleteOldProfileImage: $error");
    }
  }

  Future<void> getImage() async {
    try {
      final pickedImage = await storage!.getFileView(
        bucketId: '6566a865a7d852ba72cc',
        fileId: 'profile',
      );
      imageData.value = pickedImage as Uint8List?;
    } catch (error) {
      print("Error in getProfileImage: $error");
    }
  }
}
