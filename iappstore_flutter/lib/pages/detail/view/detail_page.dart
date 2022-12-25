import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';
import 'package:iappstore_flutter/pages/common/status_view.dart';
import 'package:iappstore_flutter/pages/detail/controller/detail_controller.dart';
import 'package:iappstore_flutter/pages/detail/view/detail_cell.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic arguments = Get.arguments;
    _requestAppDetail(arguments);

    return CupertinoPageScaffold(
      child: StatusView(
        controller: controller,
        contentBuilder: (_) {
          String largeTitle = "";
          final model = arguments[Constant.model];
          if (model.runtimeType == AppDetailMResults) {
            largeTitle = model.trackName;
          }
          if (model.runtimeType == AppRankMFeedEntry) {
            largeTitle = model.imname.label;
          }

          return CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text(
                  largeTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.travel_explore),
                border: const Border(),
                previousPageTitle: "Back",
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

  void _requestAppDetail(dynamic arguments) {
    String appID = arguments[Constant.appID];
    String regionName = arguments[Constant.regionName];
    controller.appDetailData(appID, regionName);
  }
}
