import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/status_view.dart';
import 'package:iappstore_flutter/pages/subscription/controller/subscription_controller.dart';

class SubscriptionPage extends GetView<SubscriptionController> {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text("订阅 App 状态"),
            trailing: Icon(
              Icons.add_circle_outline,
              size: 25,
            ),
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
