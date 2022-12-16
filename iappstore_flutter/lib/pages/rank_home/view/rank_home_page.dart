import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/refresh_header_footer.dart';
import 'package:iappstore_flutter/pages/common/refresh_status_view.dart';
import 'package:iappstore_flutter/pages/rank_home/controller/rank_home_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stack_trace/stack_trace.dart';

class RankHomePage extends GetView<RankHomeController> {
  const RankHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🐑🐑🐑 ${Trace.current().frames[0].member}');
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Rank Home Page"),
      ),
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
            child: const Text("PLAY"),
          );
        },
      ),
    );
  }
}
