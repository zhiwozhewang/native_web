import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:native_web/net/DioNet.dart';
import 'package:native_web/net/api_error.dart';

import '../common/Global.dart';
import '../models/decodedata.dart';
import '../models/redirectornot.dart';
import '../net/Aes.dart';

class RedirectRepository {
  RedirectRepository({this.context});

  BuildContext? context;

  Future isRedirectOrNot(String appkey, {String? deviceNumber}) async {
    try {
      return await _isRedirectOrNot(appkey, deviceNumber: deviceNumber);
    } on APIError catch (e) {
      debugPrint(e.when(
          invalidApiKey: () => "Invalid API key",
          noInternetConnection: () => "No Internet connection",
          notFound: () => "404 not found",
          unknown: () => "Some error occurred"));
    }
  }

  Future<Decodedata> _isRedirectOrNot(String appKey,
      {String? deviceNumber}) async {
    FormData formData =
        FormData.fromMap({"appkey": appKey, "deviceNumber": deviceNumber});
    var redirect = await DioNet(context: context).postData(
        path: Global.apiBaseRandom,
        builder: (data) => Redirectornot.fromJson(data),
        formData: formData);
    debugPrint("请求返回${redirect.toString()}");
    return _getDeCodeData(redirect.data);
  }

  Decodedata _getDeCodeData(String encoded) {
    String str = Aes.deCrypt(encoded);
    return Decodedata.fromJson(json.decode(str));
  }
}
