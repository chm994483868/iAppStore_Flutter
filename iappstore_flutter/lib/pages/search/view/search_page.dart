import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/pages/common/status_view.dart';
import 'package:iappstore_flutter/pages/search/controller/search_controller.dart';
import 'package:iappstore_flutter/pages/search/view/search_cell.dart';
import 'package:iappstore_flutter/pages/search/view/search_text_field_widget.dart';
import 'package:iappstore_flutter/resource/constant.dart';
import 'package:iappstore_flutter/routes/routes.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("🐑🐑🐑 SearchPage build");

    return CupertinoPageScaffold(
      child: Column(
        children: [
          SizedBox(
            height: 140,
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: const Text("搜索"),
                  trailing: GestureDetector(
                    onTap: () {
                      final current = controller.filterViewIsExpanded.value;
                      controller.filterViewIsExpanded.value = !current;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Icon(
                          Icons.palette,
                          size: 20,
                        ),
                        Obx(() {
                          return Text(
                            controller.regionName.value,
                            style: const TextStyle(color: Colors.blue),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 1,
            child: Column(
              children: [
                _getSearchWidget(),
                _searchFilterView(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
                    child: StatusView(
                      controller: controller,
                      contentBuilder: (_) {
                        return CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate((context, index) {
                                final model = controller.dataSource[index];
                                return SearchCell(
                                  model: model,
                                  index: index,
                                  callback: (model) async {
                                    final appID = model.trackId.toString();
                                    if (appID.isNotEmpty) {
                                      Get.toNamed(Routes.detailPage, arguments: {
                                        Constant.appID: appID,
                                        Constant.regionName: controller.regionName.value,
                                        Constant.model: model,
                                      });
                                    }
                                  },
                                );
                              }, childCount: controller.dataSource.length),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSearchWidget() {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: SearchTextFieldWidget(
          onSubmitted: (value) {
            // 点击了搜索按钮的回调
            debugPrint("🌹🌹🌹 onSubmitted: $value");

            // 发起搜索请求
            controller.searchAppData(value);
          },
          onCancel: () {
            controller.cancel();
          },
        ),
      ),
    );
  }

  Widget _searchFilterView() {
    return Obx(() {
      return Visibility(
        visible: controller.filterViewIsExpanded.value,
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final regionName = Constant.regionTypeLists[index];
                    if (regionName == controller.regionName.value) {
                      return GestureDetector(
                        onTap: () {
                          controller.filterViewIsExpanded.value = false;
                        },
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                regionName,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                              const Expanded(child: Text("")),
                              const Icon(
                                Icons.done,
                                size: 20,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          controller.regionName.value = regionName;
                          controller.filterViewIsExpanded.value = false;
                        },
                        child: SizedBox(
                          height: 40,
                          child: Text(
                            regionName,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }
                  }, childCount: Constant.regionTypeLists.length),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
