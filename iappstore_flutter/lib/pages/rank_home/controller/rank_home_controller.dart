import 'package:get/get.dart';
import 'package:iappstore_flutter/base/base_refresh_controller_iappstore.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';
import 'package:iappstore_flutter/enum/ranking_type.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/pages/rank_home/repository/rank_home_repository.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class RankHomeController extends BaseRefreshControlleriAppStore<RankHomeRepository, AppRankMEntity>
    implements IClassName {
  static String? get className => (RankHomeController).toString();
  List<AppRankMFeedEntry> get dataSource => response?.data?.feed?.entry ?? [];

  final rankTitle = "".obs;
  final updateTimeString = DateTime.now().toLocal().toString().obs;

  String rankName = Constant.rankingTypeLists.first;
  String categoryName = Constant.categoryTypeLists.first;
  String regionName = Constant.regionTypeLists.first;

  @override
  void onInit() {
    super.onInit();
    refreshController = Get.find(tag: RankHomeController.className);
  }

  @override
  Future<void> onRefresh() async {
    fetchRankData(false);
  }

  @override
  Future<void> onLoadMore() async {
    refreshController.refreshCompleted();
    refreshController.loadComplete();

    update();
  }

  void fetchRankData(bool isShowLoading) async {
    final rankID = Constant.rankingTypeListIds[rankName] ?? "topFreeApplications";
    final categoryID = Constant.categoryTypeListIds[categoryName] ?? "0";
    final regionID = Constant.regionTypeListIds[regionName] ?? "cn";
    final rankingType = RankingType.convert(rankID);

    if (isShowLoading == true) {
      status = ResponseStatus.loading;
      update();
    }

    response = await request.applications(url: rankingType.url(categoryID, regionID, 200));

    // 这里如何判断数据为空和网络请求错误的情况呢？
    status = ResponseStatus.successHasContent;

    rankTitle.value = (response?.data?.feed?.title?.label ?? "").split("：").last;
    updateTimeString.value = DateTime.now().toLocal().toString();

    refreshController.refreshCompleted();
    refreshController.loadComplete();

    update();
  }
}
