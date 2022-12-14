import 'dart:io';

import 'package:dio/dio.dart';
import 'package:iappstore_flutter/http_util/api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:iappstore_flutter/http_util/http_status.dart' as season;

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
    Map<String, dynamic> json = response.data;
    return json;
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

extension EnumStatus on Response {
  season.HttpStatus get status =>
      season.HttpStatus.mappingTable[statusCode] ?? season.HttpStatus.connectionError;
}
