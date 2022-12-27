import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/base/base_refresh_controller_iappstore.dart';
import 'package:iappstore_flutter/pages/common/empty_view.dart';
import 'package:iappstore_flutter/pages/common/error_view.dart';
import 'package:iappstore_flutter/pages/common/loading_view.dart';

typedef RefreshWidgetCallback<T extends BaseRefreshControlleriAppStore> = Widget Function(T);

class RefreshStatusView<T extends BaseRefreshControlleriAppStore> extends StatelessWidget {
  final T controller;
  final RefreshWidgetCallback contentBuilder;
  get value => controller.status.value;

  const RefreshStatusView({super.key, required this.controller, required this.contentBuilder});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: ((controller) {
        // value 值为几，就显示 children 中的第几个 Widget
        return IndexedStack(
          index: value,
          children: [
            // 加载 loading View
            const LoadingView(),
            // 网络请求错误后，显示一个重试按钮的 View
            ErrorView(
              retryAction: controller.onRetry,
            ),
            // 这里 contentBuilder 也可最小化在 controller 中调用 update 函数造成的 Widget 重建的性能消耗最小
            contentBuilder(controller),
            // 网络请求成功但是页面数据为空的 View
            const EmptyView(),
          ],
        );
      }),
    );
  }
}
