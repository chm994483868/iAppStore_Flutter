import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/main/controller/main_controller.dart';
import 'package:iappstore_flutter/pages/rank_home/view/rank_home_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: ((controller) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.track_changes), label: "榜单"),
              BottomNavigationBarItem(icon: Icon(Icons.manage_search_outlined), label: "搜索"),
              BottomNavigationBarItem(icon: Icon(Icons.podcasts_outlined), label: "订阅"),
              BottomNavigationBarItem(icon: Icon(Icons.sensor_occupied_outlined), label: "设置"),
            ],
            currentIndex: controller.selectedIndex,
            onTap: controller.onItemTapped,
          ),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (context) => const RankHomePage(),
                );
              case 1:
                return CupertinoTabView(
                  builder: (context) => Container(
                    color: Colors.redAccent,
                  ),
                );
              case 2:
                return CupertinoTabView(
                  builder: (context) => Container(
                    color: Colors.greenAccent,
                  ),
                );
              case 3:
                return CupertinoTabView(
                  builder: (context) => Container(
                    color: Colors.blueAccent,
                  ),
                );
              default:
                return CupertinoTabView(
                  builder: (context) => Container(),
                );
            }
          },
        );
      }),
    );
  }
}
