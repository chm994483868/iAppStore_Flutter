import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/refresh_header_footer.dart';
import 'package:iappstore_flutter/pages/common/refresh_status_view.dart';
import 'package:iappstore_flutter/pages/rank_home/controller/rank_home_controller.dart';
import 'package:iappstore_flutter/pages/rank_home/view/rank_cell.dart';
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
        middle: Text(
          "免费 App 排行",
          style: TextStyle(fontSize: 18, color: Color(0xFF0094FF)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                          Get.toNamed(Routes.detailPage, arguments: model);
                        },
                      );
                    }, childCount: controller.dataSource.length),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
