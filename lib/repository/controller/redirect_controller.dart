import 'package:flutter/material.dart';
import 'package:native_web/models/decodedata.dart';

import '../../route/webviewpage_inapp.dart';
import '../redirect_repository.dart';

class RedirectController {
  RedirectController(this.context) {
    redirectRepository = RedirectRepository(context: context);
  }

  BuildContext? context;
  RedirectRepository? redirectRepository;

  void isRedirectOrNot(String appKey, {String? deviceNum}) async {
    Decodedata decodeData = await redirectRepository?.isRedirectOrNot(appKey,
        deviceNumber: deviceNum);

    if (decodeData.iswap == 1) {
      // 需要跳转
      if (context != null) {

        Navigator.push(context!, MaterialPageRoute(builder: (context){
          return WebViewPageInApp(decodeData: decodeData,);
        }));
        // Navigator.of(context!).pushNamed("webView", arguments: decodeData);
      }
    }
  }
}
