import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iappstore_flutter/base/base_request_controller.dart';
import 'package:iappstore_flutter/pages/common/empty_view.dart';
import 'package:iappstore_flutter/pages/common/error_view.dart';
import 'package:iappstore_flutter/pages/common/loading_view.dart';

typedef WidgetCallback<T extends BaseRequestController> = Widget Function(T);

class StatusView<T extends BaseRequestController> extends StatelessWidget {
  final T controller;
  final WidgetCallback contentBuilder;
  get value => controller.status.value;

  const StatusView({super.key, required this.controller, required this.contentBuilder});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: ((controller) {
        return IndexedStack(
          index: value,
          children: [
            const LoadingView(),
            ErrorView(
              retryAction: controller.request.retry,
            ),
            contentBuilder(controller),
            const EmptyView(),
          ],
        );
      }),
    );
  }
}
