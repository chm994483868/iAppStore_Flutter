import 'package:get/get.dart';
import 'package:iappstore_flutter/base/base_refresh_controller.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';
import 'package:iappstore_flutter/entity/base_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/enum/scroll_view_action_type.dart';
import 'package:iappstore_flutter/pages/rank_home/repository/rank_home_repository.dart';

class RankHomeController extends BaseRefreshController<RankHomeRepository, AppRankMEntity> implements IClassName {
  static String? get className => (RankHomeController).toString();

  @override
  void onInit() {
    super.onInit();

    initPage = Get.find<int>(tag: RankHomeController.className);
    page = initPage;
    refreshController = Get.find(tag: RankHomeController.className);
  }

  @override
  Future<void> onRefresh() async {
    page = initPage;
    await aRequest(type: ScrollViewActionType.refresh);
  }

  @override
  Future<void> onLoadMore() async {
    page = page + 1;
    await aRequest(type: ScrollViewActionType.loadMore);
  }

  @override
  Future<void> aRequest({required ScrollViewActionType type, Map<String, dynamic>? parameters}) async {
    response = await request.getTopFreeApplications(cid: "", country: "", limit: "");
    status = response.responseStatus ?? ResponseStatus.loading;
    final models = response.data.dataSource ?? [];

    switch (type) {
      case ScrollViewActionType.refresh:
        final result = await Future.wait(
          [request.getTopFreeApplications(cid: "", country: "country", limit: "")],
          cleanUp: (successValue) => print(successValue),
        );

        if (result.length == 1) {
          dataSource = result[0].data;
        } else {
          response = BaseEntity(null, null, null);
        }

        break;
      case ScrollViewActionType.loadMore:
        response = await request.getTopFreeApplications(cid: "", country: "", limit: "");
        dataSource.addAll(models);
        break;
    }

    refreshControllerStatusUpdate(type);

    update();
  }
}
