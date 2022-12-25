import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/enum/rank_sort_type.dart';
import 'package:iappstore_flutter/resource/constant.dart';

// ignore: must_be_immutable
class RankSortView extends StatelessWidget {
  String rankName;
  String categoryName;
  String regionName;
  final ValueChanged<List<String>>? _callback;

  RankSortView(
      {super.key,
      required this.rankName,
      required this.categoryName,
      required this.regionName,
      ValueChanged<List<String>>? callback})
      : _callback = callback;

  final sortViewIsExpanded = false.obs;
  final currentSortType = RankSortType.none.obs;

  final rankNameObs = "".obs;
  final categoryObs = "".obs;
  final regionNameObs = "".obs;

  @override
  Widget build(BuildContext context) {
    rankNameObs.value = rankName;
    categoryObs.value = categoryName;
    regionNameObs.value = regionName;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              // flex: 1,
              child: Obx(
                () {
                  return _createSortLabel(rankNameObs.value, RankSortType.rank);
                },
              ),
            ),
            Expanded(
              // flex: 1,
              child: Obx(
                () {
                  return _createSortLabel(categoryObs.value, RankSortType.category);
                },
              ),
            ),
            Expanded(
              // flex: 1,
              child: Obx(
                () {
                  return _createSortLabel(regionNameObs.value, RankSortType.region);
                },
              ),
            ),
          ],
        ),
        Obx(() {
          if (sortViewIsExpanded.value == true) {
            List<String> titleList = [];
            int selectIndex = 0;
            switch (currentSortType.value) {
              case RankSortType.rank:
                titleList = Constant.rankingTypeLists;
                selectIndex = titleList.indexOf(rankName);
                break;
              case RankSortType.category:
                titleList = Constant.categoryTypeLists;
                selectIndex = titleList.indexOf(categoryName);
                break;
              case RankSortType.region:
                titleList = Constant.regionTypeLists;
                selectIndex = titleList.indexOf(regionName);
                break;
              case RankSortType.none:
                break;
            }
            return SizedBox(
              height: 210,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    final title = titleList[index];
                    if (index == selectIndex) {
                      return _selectedItem(title);
                    } else {
                      return InkWell(
                        onTap: () {
                          debugPrint("🌶️🌶️🌶️ Click: ${titleList[index]}");

                          final selectTitle = titleList[index];
                          switch (currentSortType.value) {
                            case RankSortType.rank:
                              rankName = selectTitle;
                              rankNameObs.value = selectTitle;
                              break;
                            case RankSortType.category:
                              categoryName = selectTitle;
                              categoryObs.value = selectTitle;
                              break;
                            case RankSortType.region:
                              regionName = selectTitle;
                              regionNameObs.value = selectTitle;
                              break;
                            case RankSortType.none:
                              break;
                          }
                          sortViewIsExpanded.value = false;
                          currentSortType.value = RankSortType.none;

                          // 回调
                          if (_callback != null) {
                            _callback!([rankNameObs.value, categoryObs.value, regionNameObs.value]);
                          }
                        },
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(fontWeight: FontWeight.normal),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    }
                  }, childCount: titleList.length)),
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 0,
            );
          }
        }),
      ],
    );
  }

  Widget _createSortLabel(String title, RankSortType type) {
    return GestureDetector(
      onTap: () {
        if (currentSortType.value == type) {
          sortViewIsExpanded.value = false;
          currentSortType.value = RankSortType.none;
        } else {
          sortViewIsExpanded.value = true;
          currentSortType.value = type;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Obx(() {
            if (currentSortType.value == type) {
              return const Icon(
                Icons.expand_less,
                color: Colors.black,
                size: 25,
              );
            } else {
              return const Icon(
                Icons.expand_more,
                color: Colors.black,
                size: 25,
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _selectedItem(String title) {
    return SizedBox(
      height: 40,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Icon(
                Icons.done,
                color: Colors.blue,
              )
            ],
          ),
          const Divider(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
