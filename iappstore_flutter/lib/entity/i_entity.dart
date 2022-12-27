import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/generated/json/base/json_convert_content.dart';

/// 定义抽象泛型类 IEntity 作为 BaseEntity/BaseEntityiAppStore 的基类，为它们提供一个 generateOBJ 函数，完成 Json 数据到 T 的模型转换。
abstract class IEntity<T> {
  T? generateOBJ<O>(Object? json) {
    if (json == null) {
      return null;
    }

    if (typeName(T) == 'String') {
      return json.toString() as T;
    } else if (typeName(T) == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List 类型数据由 fromJsonAsT 判断处理
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }
}
