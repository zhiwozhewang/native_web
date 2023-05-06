import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import '../common/Global.dart';
import 'api_error.dart';

class DioNet {
  DioNet({this.context}) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = Dio(BaseOptions(
    baseUrl: Global.apiBase,
    contentType: 'application/x-www-form-urlencoded',
  ));

  static void init() {
    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (client) {
        // client.findProxy = (uri) {
        //   return 'PROXY 192.168.50.154:8888';
        // };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return null;
      };
    }
  }

  Future<T> getData<T>({
    required String path,
    required T Function(dynamic data) builder,
    Options? options,
  }) async {
    try {
      var reponse = await dio.get(path, options: options ?? _options);

      switch (reponse.statusCode) {
        case 200:
          var data = json.decode(reponse.data);
          return builder(data);
        case 401:
          throw const APIError.invalidApiKey();
        case 404:
          throw const APIError.notFound();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }

  Future<T> postData<T>({
    required String path,
    required T Function(dynamic data) builder,
    Options? options,
    FormData? formData,
  }) async {
    try {
      var reponse =
          await dio.post(path, options: options ?? _options, data: formData);
      switch (reponse.statusCode) {
        case 200:
          // var data = json.decode(reponse.data);
          return builder(reponse.data);
        case 401:
          throw const APIError.invalidApiKey();
        case 404:
          throw const APIError.notFound();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }
}
