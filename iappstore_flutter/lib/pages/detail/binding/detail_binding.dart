import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/detail/controller/detail_controller.dart';
import 'package:iappstore_flutter/pages/detail/repository/detail_repository.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailRepository());
    Get.lazyPut(() => DetailController());
  }
}