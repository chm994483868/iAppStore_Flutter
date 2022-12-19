import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/main/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainController(),
    );
  }
}
