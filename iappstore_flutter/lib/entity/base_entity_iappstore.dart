import 'package:iappstore_flutter/entity/i_entity.dart';

/// 继承自 IEntity 的泛型类
class BaseEntityiAppStore<T> extends IEntity<T> {
  T? data;

  // 构造函数
  BaseEntityiAppStore(this.data);

  // Map<String, dynamic> 转化为 BaseEntity
  BaseEntityiAppStore.fromJson(Map<String, dynamic> json) {
    // generateOBJ 函数来自父类 IEntity
    data = generateOBJ<T>(json);
  }
}
