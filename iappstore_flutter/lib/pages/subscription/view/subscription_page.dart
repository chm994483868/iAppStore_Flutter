import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/search/view/search_text_field_widget.dart';
import 'package:iappstore_flutter/pages/subscription/controller/subscription_controller.dart';

class SubscriptionPage extends GetView<SubscriptionController> {
  const SubscriptionPage({super.key});

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
                  largeTitle: Text("订阅产品"),
                  trailing: Icon(Icons.tune),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                _getSearchWidget(),
              ],
            ),
          ),

          // SliverFillRemaining(
          //       child: StatusView(
          //         controller: controller,
          //         contentBuilder: (_) {
          //           return CustomScrollView(
          //             slivers: [
          //               SliverList(
          //                 delegate: SliverChildBuilderDelegate(
          //                   (context, index) {
          //                     // return DetailCell(model: controller.result);
          //                     return const Text("123");
          //                   },
          //                   childCount: 1,
          //                 ),
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //     ),
        ],
      ),
    );
  }

  Widget _getSearchWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SearchTextFieldWidget(
                enabled: true, hintText: "1111", onSubmitted: (searchContent) {}),
          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                '取消',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
            onTap: () {
              // Navigator.pop(context);
              //
            },
          )
        ],
      ),
    );
  }
}
