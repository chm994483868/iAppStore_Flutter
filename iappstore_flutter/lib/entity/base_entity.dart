import 'package:iappstore_flutter/entity/i_entity.dart';
import 'package:iappstore_flutter/entity/page_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/resource/constant.dart';

/// 继承自 IEntity 的泛型类
class BaseEntity<T> extends IEntity<T> {
  int? errorCode;
  String? errorMsg;
  T? data;

  // 构造函数
  BaseEntity(this.errorCode, this.errorMsg, this.data);

  // Map<String, dynamic> 转化为 BaseEntity
  BaseEntity.fromJson(Map<String, dynamic> json) {
    errorCode = json[Constant.errorCode] as int?;
    errorMsg = json[Constant.errorMsg] as String?;
    if (json.containsKey(Constant.data)) {
      // generateOBJ 函数来自父类 IEntity
      data = generateOBJ<T>(json[Constant.data] as Object?);
    }
  }

  // 是否请求成功的的 get
  bool get isSuccess => errorCode == 0;
  // 请求响应状态的 get
  ResponseStatus get responseStatus => _responseStatus;

  // 请求响应状态的私有 get
  ResponseStatus get _responseStatus {
    if (errorCode == null) {
      // 正在请求中
      return ResponseStatus.loading;
    } else if (errorCode == 0) {
      // 请求成功
      if (data is List) {
        // 如果 data 是一个 List
        final listData = data as List;
        // 如果 data 不是空的 List 的话则请求响应成功并有数据，否则就是响应成功但是没有数据
        if (listData.isNotEmpty) {
          return ResponseStatus.successHasContent;
        } else {
          return ResponseStatus.successNoData;
        }
      } else if (data is PageEntity) {
        // 如果响应返回的 data 是一个 PageEntity 的话，则说明返回的是分段加载的数据
        final pageEntity = data as PageEntity;
        final dataSource = pageEntity.dataSource as List;
        // 如果当前请求的这个分段响应成功但是 List 为空的话表明是响应成功但是没有数据，否则是响应成功并且有数据
        if (dataSource.isNotEmpty) {
          return ResponseStatus.successHasContent;
        } else {
          return ResponseStatus.successNoData;
        }
      } else {
        // 其他情况的话，如果 data 不是 null 就是响应成功并且有数据，否则就是响应成功并且没数据
        if (data != null) {
          return ResponseStatus.successHasContent;
        } else {
          return ResponseStatus.successNoData;
        }
      }
    } else {
      // 请求失败
      return ResponseStatus.fail;
    }
  }
}
