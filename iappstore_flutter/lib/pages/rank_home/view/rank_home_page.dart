import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/refresh_header_footer.dart';
import 'package:iappstore_flutter/pages/common/refresh_status_view.dart';
import 'package:iappstore_flutter/pages/rank_home/view/rank_sort_view.dart';
import 'package:iappstore_flutter/pages/rank_home/controller/rank_home_controller.dart';
import 'package:iappstore_flutter/pages/rank_home/view/rank_cell.dart';
import 'package:iappstore_flutter/resource/constant.dart';
import 'package:iappstore_flutter/routes/routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stack_trace/stack_trace.dart';

class RankHomePage extends GetView<RankHomeController> {
  const RankHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🐑🐑🐑 ${Trace.current().frames[0].member}');
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: const Border(),
        middle: Obx(() {
          return Text(
            controller.rankTitle.value,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          );
        }),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
        child: Column(
          children: [
            Obx(() {
              return Text(controller.updateTimeString.value);
            }),
            const SizedBox(
              height: 10,
            ),
            RankSortView(
              rankName: controller.rankName,
              categoryName: controller.categoryName,
              regionName: controller.regionName,
              callback: (list) {
                debugPrint("💥💥💥 筛选栏选中的回调：${list[0]}, ${list[1]}, ${list[2]}");

                controller.rankName = list[0];
                controller.categoryName = list[1];
                controller.regionName = list[2];

                // 请求指定分类的数据
                controller.fetchRankData(true);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: RefreshStatusView(
                controller: controller,
                contentBuilder: (_) {
                  return SmartRefresher(
                    enablePullUp: true,
                    header: const RefreshHeader(),
                    footer: const RefreshFooter(),
                    controller: controller.refreshController,
                    onRefresh: controller.onRefresh,
                    onLoading: controller.onLoadMore,
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate((context, index) {
                            final model = controller.dataSource[index];
                            return RankCell(
                              model: model,
                              index: index,
                              callback: (model) async {
                                final appID = model.id?.attributes?.imid;
                                if (appID != null && appID.isNotEmpty) {
                                  Get.toNamed(Routes.detailPage, arguments: {
                                    Constant.appID: appID,
                                    Constant.regionName: controller.regionName,
                                    Constant.model: model,
                                  });
                                }
                              },
                            );
                          }, childCount: controller.dataSource.length),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
