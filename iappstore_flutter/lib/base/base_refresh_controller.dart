import 'package:get/get.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/base_entity.dart';
import 'package:iappstore_flutter/entity/page_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/enum/scroll_view_action_type.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseRefreshController<R extends IRepository, T> extends GetxController {
  late R request;

  late RefreshController refreshController;

  late int page;

  late int initPage;

  ResponseStatus status = ResponseStatus.loading;

  BaseEntity<PageEntity<List<T>>>? response;

  List<T> dataSource = [];

  @override
  void onInit() async {
    super.onInit();
    request = Get.find<R>();
  }

  @override
  void onClose() {
    super.onClose();
    // refreshController.dispose();
  }

  Future<void> onRefresh() async {}
  Future<void> onLoadMore() async {}
  Future<void> aRequest({
    required ScrollViewActionType type,
    Map<String, dynamic>? parameters,
  }) async {}

  void refreshControllerStatusUpdate(ScrollViewActionType type) {
    switch (type) {
      case ScrollViewActionType.refresh:
        refreshController.refreshCompleted(resetFooterState: true);
        if (response?.data?.curPage == response?.data?.pageCount) {
          refreshController.loadNoData();
        }
        break;
      case ScrollViewActionType.loadMore:
        if (response?.data?.curPage == response?.data?.pageCount) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }

        checkDataSourceAndStatus();
        break;
    }
  }

  void checkDataSourceAndStatus() {
    if (status == ResponseStatus.successNoData && dataSource.isNotEmpty) {
      status = ResponseStatus.successHasContent;
    }
  }
}
