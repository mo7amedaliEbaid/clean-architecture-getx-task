import 'package:get/get.dart';
import 'package:mobile_test_task/controllers/controllers.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
