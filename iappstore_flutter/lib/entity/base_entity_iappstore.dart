import 'package:iappstore_flutter/entity/i_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/resource/constant.dart';

/// 继承自 IEntity 的泛型类
class BaseEntityiAppStore<T> extends IEntity<T> {
  T? data;

  int? errorCode;
  String? errorMsg;

  // 构造函数
  BaseEntityiAppStore(this.errorCode, this.errorMsg, this.data);

  // Map<String, dynamic> 转化为 BaseEntity
  BaseEntityiAppStore.fromJson(Map<String, dynamic> json) {
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
      // 其他情况的话，如果 data 不是 null 就是响应成功并且有数据，否则就是响应成功并且没数据
      if (data != null) {
        return ResponseStatus.successHasContent;
      } else {
        return ResponseStatus.successNoData;
      }
    } else {
      // 请求失败
      return ResponseStatus.fail;
    }
  }
}
