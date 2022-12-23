import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/enum/rank_sort_type.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class RankSortView extends StatelessWidget {
  String rankName;
  String categoryName;
  String regionName;

  RankSortView(
      {super.key, required this.rankName, required this.categoryName, required this.regionName});

  final sortViewIsExpanded = false.obs;
  final currentSortType = RankSortType.none.obs;

  final tempRankName = "123".obs;
  final tempCategoryName = "456".obs;
  final tempRegionName = "789".obs;

  @override
  Widget build(BuildContext context) {
    tempRankName.value = rankName;
    tempCategoryName.value = categoryName;
    tempRegionName.value = regionName;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Obx(
                () {
                  return _createSortLabel(tempRankName.value, RankSortType.rank);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Obx(
                () {
                  return _createSortLabel(tempCategoryName.value, RankSortType.category);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Obx(
                () {
                  return _createSortLabel(tempRegionName.value, RankSortType.region);
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
                      return _unselectedItem(title);
                    } else {
                      return InkWell(
                        onTap: () {
                          // 回调选中了某项
                          debugPrint("🌶️🌶️🌶️：Click: ${titleList[index]}");
                          final selectTitle = titleList[index];
                          switch (currentSortType.value) {
                            case RankSortType.rank:
                              rankName = selectTitle;
                              tempRankName.value = selectTitle;
                              break;
                            case RankSortType.category:
                              categoryName = selectTitle;
                              tempCategoryName.value = selectTitle;
                              break;
                            case RankSortType.region:
                              regionName = selectTitle;
                              tempRegionName.value = selectTitle;
                              break;
                            case RankSortType.none:
                              break;
                          }
                          currentSortType.value = RankSortType.none;
                        },
                        child: SizedBox(
                          height: 30,
                          child: Text(
                            title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    }
                  }, childCount: titleList.length)),
                ],
              ),
            );
          } else {
            return const SizedBox();
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
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
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

  Widget _unselectedItem(String title) {
    return SizedBox(
      height: 30,
      child: Row(
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
    );
  }
}
