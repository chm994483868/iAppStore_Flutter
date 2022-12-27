import 'package:flutter/widgets.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';
import 'package:iappstore_flutter/entity/base_entity_iappstore.dart';
import 'package:iappstore_flutter/http_util/request.dart' as http;

class RankHomeRepository extends IRepository {
  Future<BaseEntityiAppStore<AppRankMEntity>> applications({required String url}) =>
      http.Request.postiAppStore(api: url);
}
