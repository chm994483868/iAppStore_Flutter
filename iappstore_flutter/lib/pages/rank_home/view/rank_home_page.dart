import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/refresh_header_footer.dart';
import 'package:iappstore_flutter/pages/common/refresh_status_view.dart';
import 'package:iappstore_flutter/pages/detail/view/rank_sort_view.dart';
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
      navigationBar: const CupertinoNavigationBar(
        border: Border(
            top: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
            bottom: BorderSide.none),
        middle: Text(
          "免费 App 排行",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          children: [
            Text(DateTime.now().toString()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RankSortView(
                rankName: Constant.rankingTypeLists.first,
                categoryName: Constant.categoryTypeLists.first,
                regionName: Constant.regionTypeLists.first,
              ),
            ),
            const SizedBox(
              height: 20,
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
                            // return Text(model.imname?.label.toString() ?? "");
                            return RankCell(
                              model: model,
                              index: index,
                              callback: (model) async {
                                Get.toNamed(Routes.detailPage, arguments: model);
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
