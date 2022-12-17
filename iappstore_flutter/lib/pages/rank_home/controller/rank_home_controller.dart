import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/base/base_refresh_controller_iappstore.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/enum/scroll_view_action_type.dart';
import 'package:iappstore_flutter/pages/rank_home/repository/rank_home_repository.dart';
import 'package:stack_trace/stack_trace.dart';

class RankHomeController extends BaseRefreshControlleriAppStore<RankHomeRepository, AppRankMEntity>
    implements IClassName {
  static String? get className => (RankHomeController).toString();
  List<AppRankMFeedEntry> get dataSource => response?.data?.feed?.entry ?? [];

  @override
  void onInit() {
    super.onInit();
    refreshController = Get.find(tag: RankHomeController.className);
    // debugPrint('🐑🐑🐑 ${Trace.current().frames[0].member}');
  }

  @override
  Future<void> onRefresh() async {
    await aRequest(type: ScrollViewActionType.refresh);
  }

  @override
  Future<void> aRequest(
      {required ScrollViewActionType type, Map<String, dynamic>? parameters}) async {
    response = await request.getTopFreeApplications(cid: "", country: "", limit: 20);
    status = ResponseStatus.successHasContent;
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    debugPrint("🌹🌹🌹 dataSource => length: ${response?.data?.feed?.entry?.length}");

    update();
  }
}
