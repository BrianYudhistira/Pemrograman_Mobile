import 'package:appwrite/appwrite.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ClientController extends GetxController {
  Client client = Client();
  @override
  void onInit() {
    super.onInit();

    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "65669d2fd42ca2227f09";
    client.setEndpoint(endPoint).setProject(projectID).setSelfSigned(status: true);
  }
}