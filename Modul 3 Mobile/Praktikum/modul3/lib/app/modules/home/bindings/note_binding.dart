import 'package:get/get.dart';

import '../controllers/Note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteController>(
          () => NoteController(),
    );
  }
}
