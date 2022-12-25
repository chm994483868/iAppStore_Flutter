import 'package:get/instance_manager.dart';
import 'package:iappstore_flutter/pages/rank_home/controller/rank_home_controller.dart';
import 'package:iappstore_flutter/pages/rank_home/repository/rank_home_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RankHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RankHomeRepository());
    Get.lazyPut(() => RankHomeController());

    Get.lazyPut(tag: RankHomeController.className, () => RefreshController(initialRefresh: true));
    Get.lazyPut<int>(tag: RankHomeController.className, () => 1);
  }
}
