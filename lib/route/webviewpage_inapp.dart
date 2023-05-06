import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../models/decodedata.dart';

class WebViewPageInApp extends StatefulWidget {
  const WebViewPageInApp({super.key,  required this.decodeData});

  final Decodedata decodeData;

  @override
  State<WebViewPageInApp> createState() => _BrowserState();
}

class _BrowserState extends State<WebViewPageInApp> {
  final GlobalKey webViewKey = GlobalKey();
  late InAppWebViewController _inAppWebViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),

    /// android 支持HybridComposition
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    //  路由传参
    // var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("webview_inapt"),
      ),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest:
            URLRequest(url: Uri.parse(widget.decodeData.wapurl )),
        initialOptions: options,
        // InAppWebview中获取InAppWebViewController
        onWebViewCreated: (InAppWebViewController inAppWebViewController) {
          _inAppWebViewController = inAppWebViewController;
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) {
          _addJsHandler();
        },
      ),
    );
  }

  void _addJsHandler() {
    debugPrint("_addJsHandler");
    _inAppWebViewController.evaluateJavascript(
        source: "window.jsBridge = {};"
            "window.jsBridge.postMessage = function (...data) {"
            " window.flutter_inappwebview.callHandler('jsBridge', ...data);"
            "};");

    _inAppWebViewController.addJavaScriptHandler(
        handlerName: "jsBridge",
        callback: (args) {
          debugPrint("js调用flutter$args");
        });
  }
}
