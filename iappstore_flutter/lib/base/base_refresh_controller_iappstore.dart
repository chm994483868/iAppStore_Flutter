import 'package:get/get.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/base_entity_iappstore.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/enum/scroll_view_action_type.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseRefreshControlleriAppStore<R extends IRepository, T> extends GetxController {
  late R request;
  late RefreshController refreshController;

  ResponseStatus status = ResponseStatus.loading;
  BaseEntityiAppStore<T>? response;

  @override
  void onInit() async {
    super.onInit();
    request = Get.find<R>();
  }

  Future<void> onRefresh() async {}
  Future<void> onLoadMore() async {}
  Future<void> aRequest({
    required ScrollViewActionType type,
    Map<String, dynamic>? parameters,
  }) async {}
}
