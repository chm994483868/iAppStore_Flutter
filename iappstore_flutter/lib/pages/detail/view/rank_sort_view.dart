import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/enum/rank_sort_type.dart';

class RankSortView extends StatelessWidget {
  RankSortView({super.key});

  final sortViewIsExpanded = false.obs;
  final currentSortType = RankSortType.none.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: _createSortLabel("热门免费榜", RankSortType.rank),
            ),
            Expanded(
              flex: 1,
              child: _createSortLabel("所有 App", RankSortType.category),
            ),
            Expanded(
              flex: 1,
              child: _createSortLabel("中国", RankSortType.region),
            ),
          ],
        ),
        Obx(() {
          if (sortViewIsExpanded.value == true) {
            return SizedBox(
              height: 150,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return const Text("123");
                  }, childCount: 20)),
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
            debugPrint("🐶🐶🐶：${type.toString()}");
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
}
