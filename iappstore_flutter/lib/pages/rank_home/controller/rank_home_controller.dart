import 'package:flutter/material.dart';
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
  // 实现 IClassName 抽象类中定义的 className
  static String? get className => (RankHomeController).toString();

  // 取得请求得到的 App 排行榜数据列表
  List<AppRankMFeedEntry> get dataSource => response?.data?.feed?.entry ?? [];

  // 导航栏中的标题，因为要动态更新，所以这里使用 RxString 类型
  final rankTitle = "排行榜".obs;
  // 导航栏底部的更新时间，因为要动态更新，同样使用 RxString 类型
  final updateTimeString = DateTime.now().toLocal().toString().obs;

  // 筛选页面默认三个筛选项：都用数据源中第一个筛选项：热门免费榜-所有 App-中国
  String rankName = Constant.rankingTypeLists.first;
  String categoryName = Constant.categoryTypeLists.first;
  String regionName = Constant.regionTypeLists.first;

  @override
  void onInit() {
    super.onInit();

    // 在 init 中直接 find 到 RankHomeBinding 中 dependencies 函数中添加的：Get.lazyPut(tag: RankHomeController.className, () => RefreshController(initialRefresh: true));
    refreshController = Get.find(tag: RankHomeController.className);
  }

  // 刷新函数直接调用 fetchRankData，传 false 不显示加载 loading
  @override
  Future<void> onRefresh() async {
    fetchRankData(false);
  }

  // rank_home 不需要加载更多，这里直接 loadComplete 完成，并 update
  @override
  Future<void> onLoadMore() async {
    refreshController.loadComplete();

    update();
  }

  // 根据当前的筛选类型搜索排行榜的数据
  void fetchRankData(bool isShowLoading) async {
    // 根据排行榜的名字，找到对应的排行榜的 ID
    final rankID = Constant.rankingTypeListIds[rankName] ?? "topFreeApplications";
    // 根据类型的名字，找到对应的类型的 ID
    final categoryID = Constant.categoryTypeListIds[categoryName] ?? "0";
    // 根据地区的名字，找到对应的地区的 ID
    final regionID = Constant.regionTypeListIds[regionName] ?? "cn";
    // 根据排行榜的 ID 找到对应的枚举类型
    final rankingType = RankingType.convert(rankID);

    // 根据入参判断是否需要展示 loading 动画
    if (isShowLoading == true) {
      status = ResponseStatus.loading;
      update();
    }

    // 请求排行榜的 App 数据列表
    response = await request.applications(url: rankingType.url(categoryID, regionID, 200));

    // 请求响应以后根据响应的状态更新 status 的值，此值决定了 rank_home 页面的显示内容：loading 页面、空页面、App 列表页面、请求失败的重试页面
    status = response?.responseStatus ?? ResponseStatus.successHasContent;

    // 根据响应的数据更新导航栏的标题
    rankTitle.value = (response?.data?.feed?.title?.label ?? "").split("：").last;
    // 更新更新的时间
    updateTimeString.value = DateTime.now().toLocal().toString();
    // 如果是下拉刷新的话，结束刷新动画
    refreshController.refreshCompleted();

    // 更新 RankHome 中 RefreshStatusView 中 contentBuilder 中的内容
    update();
  }

  @override
  void onRetry() {
    super.onRetry();

    debugPrint("🧶🧶🧶 ⛑⛑⛑ 重试被点击");
    fetchRankData(true);
  }
}
