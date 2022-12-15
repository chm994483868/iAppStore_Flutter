import 'package:iappstore_flutter/entity/i_entity.dart';
import 'package:iappstore_flutter/entity/page_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class BaseEntity<T> extends IEntity<T> {
  int? errorCode;
  String? errorMsg;
  T? data;

  BaseEntity(this.errorCode, this.errorMsg, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    errorCode = json[Constant.errorCode] as int?;
    errorMsg = json[Constant.errorMsg] as String?;
    if (json.containsKey(Constant.data)) {
      data = generateOBJ<T>(json[Constant.data] as Object?);
    }
  }

  bool get isSuccess => errorCode == 0;

  ResponseStatus get responseStatus => _responseStatus;

  ResponseStatus get _responseStatus {
    if (errorCode == null) {
      return ResponseStatus.loading;
    } else if (errorCode == 0) {
      if (data is List) {
        final listData = data as List;
        if (listData.isNotEmpty) {
          return ResponseStatus.successHasContent;
        } else {
          return ResponseStatus.successNoData;
        }
      } else if (data is PageEntity) {
        final pageEntity = data as PageEntity;
        final dataSource = pageEntity.dataSource as List;
        if (dataSource.isNotEmpty) {
          return ResponseStatus.successHasContent;
        } else {
          return ResponseStatus.successNoData;
        }
      } else {
        if (data != null) {
          return ResponseStatus.successHasContent;
        } else {
          return ResponseStatus.successNoData;
        }
      }
    } else {
      return ResponseStatus.fail;
    }
  }
}
