import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/cupertino.dart';

import '../net/DioNet.dart';

class Global {
  static String url = "https://api.gilet.ceshi.in/testku.html";
  static String apiBase = "https://api.gilet.ceshi.in/api/v1/app/";
  static String apiBaseRandom = "random_str";
  static String appKey = "e4b3dc7b23652624118d9c769dfb5625";
  static String deviceNum = "11111";
  static const String _afDevKey = "xxxxxxxx";
  static const String _appId = "xxxxxxxx";

  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  static AppsflyerSdk? sdk;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // afDevKey在appsflyer后台，创建好应用可见，appid从应用商店复制
    final AppsFlyerOptions options = AppsFlyerOptions(
        afDevKey: _afDevKey,
        appId: _appId,
        timeToWaitForATTUserAuthorization: 15,
        showDebug: true);
    sdk = AppsflyerSdk(options);
    sdk?.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true);
    DioNet.init();
  }
}
