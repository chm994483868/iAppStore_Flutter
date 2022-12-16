import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/base/base_refresh_controller_iappstore.dart';
import 'package:iappstore_flutter/pages/common/empty_view.dart';
import 'package:iappstore_flutter/pages/common/error_view.dart';
import 'package:iappstore_flutter/pages/common/loading_view.dart';

typedef RefreshWidgetCallback<T extends BaseRefreshControlleriAppStore> = Widget
    Function(T);

class RefreshStatusView<T extends BaseRefreshControlleriAppStore>
    extends StatelessWidget {
  final T controller;
  final RefreshWidgetCallback contentBuilder;
  get value => controller.status.value;

  const RefreshStatusView(
      {super.key, required this.controller, required this.contentBuilder});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: ((controller) {
        return IndexedStack(
          index: value,
          children: [
            const LoadingView(),
            ErrorView(retryAction: controller.request.retry,),
            contentBuilder(controller),
            const EmptyView(),
          ],
        );
      }),
    );
  }
}
