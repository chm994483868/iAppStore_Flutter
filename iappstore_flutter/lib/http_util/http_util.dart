import 'dart:io';

import 'package:dio/dio.dart';
import 'package:iappstore_flutter/http_util/api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:iappstore_flutter/http_util/http_status.dart' as season;
import 'dart:convert' as convert;

const bool inProduction = bool.fromEnvironment('dart.vm.product');

abstract class HttpUtils {
  // 超时时间 1 min，dio 中是以毫秒计算的
  static const timeout = 60000000;

  /// 初始化方法私有化
  HttpUtils._();

  static final _dio = Dio(
    BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      headers: {},
    ),
  ).addPrettyPrint;

  static Options getCookieHeaderOptions() {
    // iAppStore 暂时没有 header
    String value = "";
    Options options = Options(headers: {HttpHeaders.cookieHeader: value});
    return options;
  }

  // get 请求
  static Future<Map<String, dynamic>> get({
    required String api,
    Map<String, dynamic> params = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    Options options = getCookieHeaderOptions();
    options.headers?.addAll(headers);
    Response response =
        await _dio.get(api, queryParameters: params, options: options);
    Map<String, dynamic> json = response.data;
    return json;
  }

  // post 请求
  static Future<Map<String, dynamic>> post({
    required String api,
    Map<String, dynamic> params = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    Options options = getCookieHeaderOptions();
    options.headers?.addAll(headers);
    Response response =
        await _dio.post(api, queryParameters: params, options: options);

    // ❌❌❌ 注意：itunes.apple.com 返回的数据是 String
    if (response.data.runtimeType == String) {
      Map<String, dynamic> json = convert.jsonDecode(response.data);
      return json;
    } else {
      Map<String, dynamic> json = response.data;
      return json;
    }
  }

  // request
  Future<Response<T>> request<T>(
    String api, {
    required HTTPMethod method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic> headers = const {},
  }) async {
    Response response = await _dio.request(api,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers, method: method.string));
    return response.data;
  }
}

/// 延展 Dio，给它添加一个名为 addPrettyPrint 的 get，自定义 Dio log 输出
extension AddPrettyPrint on Dio {
  Dio get addPrettyPrint {
    interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return this;
  }
}

/// 定义 HTTP 请求方式的枚举
enum HTTPMethod {
  get("GET"),
  post("POST"),
  delete("DELETE"),
  put("PUT"),
  patch("PATCH"),
  head("HEAD");

  final String string;
  const HTTPMethod(this.string);
}

/// 延展 Response 给它添加一个名为 status 的 get，根据响应的 code，从 HttpStatus.mappingTable map 中取一个对应的枚举值
extension EnumStatus on Response {
  season.HttpStatus get status =>
      season.HttpStatus.mappingTable[statusCode] ??
      season.HttpStatus.connectionError;
}
