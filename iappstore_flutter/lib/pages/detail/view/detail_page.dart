import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';
import 'package:iappstore_flutter/pages/common/status_view.dart';
import 'package:iappstore_flutter/pages/detail/controller/detail_controller.dart';
import 'package:iappstore_flutter/pages/detail/view/detail_cell.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppRankMFeedEntry entry = Get.arguments;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // middle: Text(entry.imname?.label.toString() ?? ""),
        trailing: const Icon(Icons.travel_explore),
      ),
      child: StatusView(
        controller: controller,
        contentBuilder: (_) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    entry.imname?.label.toString() ?? "",
                    style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return DetailCell(model: controller.result);
                  },
                  childCount: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
