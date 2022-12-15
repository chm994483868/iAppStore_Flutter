import 'package:iappstore_flutter/entity/i_entity.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class PageEntity<T> extends IEntity<T> {
  int? curPage;
  T? dataSource;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  PageEntity.fromJson(Map<String, dynamic> json) {
    curPage = json[Constant.curPage] as int?;
    offset = json[Constant.offset] as int?;
    over = json[Constant.over] as bool?;
    pageCount = json[Constant.pageCount] as int?;
    size = json[Constant.size] as int?;
    total = json[Constant.total] as int?;
    if (json.containsKey(Constant.datas)) {
      dataSource = generateOBJ<T>(json[Constant.datas] as Object);
    }
  }
}
