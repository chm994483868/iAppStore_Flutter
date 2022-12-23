import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/search/controller/search_controller.dart';
import 'package:iappstore_flutter/pages/search/repository/search_repository.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchRepository());
    Get.lazyPut(() => SearchController());
  }
}