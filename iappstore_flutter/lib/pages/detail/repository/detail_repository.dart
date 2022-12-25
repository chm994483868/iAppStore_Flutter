import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/entity/base_entity_iappstore.dart';
import 'package:iappstore_flutter/http_util/request.dart' as http;

class DetailRepository extends IRepository {
  Future<BaseEntityiAppStore<AppDetailMEntity>> appDetailData({required String appID, required String regionID}) =>
      http.Request.postiAppStore(api: "$regionID/lookup?id=$appID");
}
