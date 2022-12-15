import 'package:iappstore_flutter/entity/i_entity.dart';
import 'package:iappstore_flutter/resource/constant.dart';

/// 继承自 IEntity 的泛型类
class PageEntity<T> extends IEntity<T> {
  int? curPage;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;
  T? dataSource;

  // Map<String, dynamic> 转化为 PageEntity
  PageEntity.fromJson(Map<String, dynamic> json) {
    curPage = json[Constant.curPage] as int?;
    offset = json[Constant.offset] as int?;
    over = json[Constant.over] as bool?;
    pageCount = json[Constant.pageCount] as int?;
    size = json[Constant.size] as int?;
    total = json[Constant.total] as int?;
    // dataSource
    if (json.containsKey(Constant.datas)) {
      dataSource = generateOBJ<T>(json[Constant.datas] as Object);
    }
  }
}
