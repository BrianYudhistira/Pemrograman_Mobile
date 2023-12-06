import 'package:get/get.dart';

import '../../../data/Database/StorageController.dart';

class ProfileController extends GetxController {
  //TODO: Implement MenuController
  final StorageController storageController = Get.put(StorageController());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
