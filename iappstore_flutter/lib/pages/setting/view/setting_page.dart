import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/setting/controller/setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(
            height: 140,
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text("设置"),
                  trailing: Icon(Icons.tune),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                Text("123"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
