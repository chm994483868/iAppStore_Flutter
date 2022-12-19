import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/entity/base_entity_iappstore.dart';
import 'package:iappstore_flutter/http_util/request.dart' as http;

class DetailRepository extends IRepository {
  Future<BaseEntityiAppStore<AppDetailMEntity>> getAppDetail(
          {required String cid, required String country, required int limit}) =>
      http.Request.postiAppStore(api: "cn/lookup?id=1484048379");
}
