import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/subscription/controller/subscription_controller.dart';
import 'package:iappstore_flutter/pages/subscription/repository/subscription_repository.dart';

class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionRepository());
    Get.lazyPut(() => SubscriptionController());
  }
}
