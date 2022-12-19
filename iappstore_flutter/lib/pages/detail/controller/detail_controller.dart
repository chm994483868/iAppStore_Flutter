import 'package:flutter/cupertino.dart';
import 'package:iappstore_flutter/base/base_request_controller.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/pages/detail/repository/detail_repository.dart';

class DetailController extends BaseRequestController<DetailRepository, AppDetailMEntity> implements IClassName {
  static String? get className => (DetailController).toString();
  AppDetailMResults? get result => response?.data?.results?.first;

  @override
  void onInit() async {
    super.onInit();
    aRequest();
  }

  @override
  Future<void> aRequest({Map<String, dynamic>? parameters}) async {
    response = await request.getAppDetail(cid: "", country: "country", limit: 20);
    status = ResponseStatus.successHasContent;
    debugPrint("这里会执行吗？");
    update();
  }
}
