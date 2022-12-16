import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/rank_home/controller/rank_home_controller.dart';
import 'package:stack_trace/stack_trace.dart';

class RankHomePage extends GetView<RankHomeController> {
  const RankHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🐑🐑🐑 ${Trace.current().frames[0].member}');
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Rank Home Page"),
      ),
      child: Center(
        child: Text("1234546"),
      ),
    );
  }
}
