import 'package:iappstore_flutter/base/base_request_controller.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/pages/detail/repository/detail_repository.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class DetailController extends BaseRequestController<DetailRepository, AppDetailMEntity> implements IClassName {
  static String? get className => (DetailController).toString();
  AppDetailMResults? get result => response?.data?.results?.first;

  void appDetailData(String appID, String regionName) async {
    String regionID = Constant.regionTypeListIds[regionName]!;
    response = await request.appDetailData(appID: appID, regionID: regionID);

    // 这里如何判断数据为空和网络请求错误的情况呢？
    status = ResponseStatus.successHasContent;

    update();
  }

  @override
  Future<void> aRequest({Map<String, dynamic>? parameters}) async {}
}
