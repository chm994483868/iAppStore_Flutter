import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';
import 'package:iappstore_flutter/entity/base_entity.dart';
import 'package:iappstore_flutter/http_util/request.dart' as http;

class RankHomeRepository extends IRepository {
  Future<BaseEntity> getTopFreeApplications({required String cid, required String country, required int limit}) =>
      http.Request.get(api: "rss/topfreeapplications/limit=20/genre=6014/json?cc=cn");
}
