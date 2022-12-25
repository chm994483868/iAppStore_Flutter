import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/status_view.dart';
import 'package:iappstore_flutter/pages/setting/controller/setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text("设置"),
            border: Border(),
          ),
          SliverFillRemaining(
            // child: Text("123"),
            child: StatusView(
              controller: controller,
              contentBuilder: (_) {
                return CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return const Text("waiting");
                      }, childCount: 1),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
