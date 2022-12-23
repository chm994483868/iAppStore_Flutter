import 'package:flutter/material.dart';
import 'package:iappstore_flutter/base/base_request_controller.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/pages/search/repository/search_repository.dart';

class SearchController extends BaseRequestController<SearchRepository, AppDetailMEntity>
    implements IClassName {
  static String? get className => (SearchController).toString();
  AppDetailMResults? get result => response?.data?.results?.first;

  @override
  void onInit() async {
    super.onInit();

    status = ResponseStatus.successNoData;
  }

  @override
  Future<void> aRequest({Map<String, dynamic>? parameters}) async {
    response = await request.searchAppData(appId: "", keyWord: "", regionName: "");
    status = ResponseStatus.successHasContent;
    debugPrint("这里会执行吗？");
    update();
  }
}
