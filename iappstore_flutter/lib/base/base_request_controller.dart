import 'dart:ffi';

import 'package:get/get.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/base_entity_iappstore.dart';
import 'package:iappstore_flutter/enum/response_status.dart';

abstract class BaseRequestController<R extends IRepository, T> extends GetxController {
  late R request;

  ResponseStatus status = ResponseStatus.loading;
  BaseEntityiAppStore<T>? response;

  @override
  void onInit() async {
    super.onInit();
    request = Get.find<R>();
  }

  Future<void> aRequest({
    Map<String, dynamic>? parameters,
  }) async {}
}
