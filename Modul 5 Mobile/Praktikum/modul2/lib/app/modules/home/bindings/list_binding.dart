import 'package:get/get.dart';

import '../controllers/Navbar_controller.dart';

class listBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Navbar_Controller>(
          () => Navbar_Controller(),
    );
  }
}
