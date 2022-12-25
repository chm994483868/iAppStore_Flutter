import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/entity/base_entity_iappstore.dart';
import 'package:iappstore_flutter/http_util/request.dart' as http;

class SearchRepository extends IRepository {
  Future<BaseEntityiAppStore<AppDetailMEntity>> searchAppData(
          {required String keyWord, required String regionId}) =>
      http.Request.postiAppStore(api: "search?term=$keyWord&country=$regionId&limit=200&entity=software");
}