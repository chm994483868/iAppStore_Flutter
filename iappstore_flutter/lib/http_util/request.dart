import 'package:iappstore_flutter/entity/base_entity.dart';
import 'package:iappstore_flutter/entity/base_entity_iappstore.dart';
import 'package:iappstore_flutter/http_util/http_util.dart';

/// 延展 HttpUtils 添加 get<T> 和 post<T> 函数
extension Request on HttpUtils {
  /// Get 请求直接转模型
  static Future<BaseEntity<T>> get<T>({required String api, Map<String, dynamic> params = const {}}) async {
    final data = await HttpUtils.get(api: api, params: params);
    final model = BaseEntity<T>.fromJson(data);
    return model;
  }

  /// Post 请求
  static Future<BaseEntity<T>> post<T>({required String api, Map<String, dynamic> params = const {}}) async {
    final data = await HttpUtils.post(api: api, params: params);
    final model = BaseEntity<T>.fromJson(data);
    return model;
  }

  /// for iAppStore
  static Future<BaseEntityiAppStore<T>> getiAppStore<T>(
      {required String api, Map<String, dynamic> params = const {}}) async {
    final data = await HttpUtils.get(api: api, params: params);
    final model = BaseEntityiAppStore<T>.fromJson(data);
    return model;
  }

  static Future<BaseEntityiAppStore<T>> postiAppStore<T>(
      {required String api, Map<String, dynamic> params = const {}}) async {
    final data = await HttpUtils.post(api: api, params: params);
    final model = BaseEntityiAppStore<T>.fromJson(data);
    return model;
  }
}
