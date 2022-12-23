import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/setting/controller/setting_controller.dart';
import 'package:iappstore_flutter/pages/setting/repository/setting_repository.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingRepository());
    Get.lazyPut(() => SettingController());
  }
}