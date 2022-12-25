import 'package:iappstore_flutter/base/base_request_controller.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/pages/setting/repository/setting_repository.dart';

class SettingController extends BaseRequestController<SettingRepository, AppDetailMEntity> implements IClassName {
  static String? get className => (SettingController).toString();

  @override
  void onInit() async {
    super.onInit();

    status = ResponseStatus.successNoData;
  }

  @override
  Future<void> aRequest({Map<String, dynamic>? parameters}) async {}
}
