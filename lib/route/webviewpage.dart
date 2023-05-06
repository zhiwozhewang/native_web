import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;
  final String _title = "webview";

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  Future<void> _loadHtmlFromAsset() async {
    String html = 'assets/static/test.html';
    final String path = await rootBundle.loadString(html);
    _controller.loadUrl(Uri.dataFromString(path,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_title),
      ),
      child: SafeArea(
        child: WebView(
          // initialUrl: "https://api.gilet.ceshi.in/testku.html",
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
            _loadHtmlFromAsset();
            debugPrint("js调用flutter，onWebViewCreated");
          },
          javascriptChannels: <JavascriptChannel>{
            _alertJavascriptChannel(context),
          },
        ),
      ),
    );
  }

  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'jsBridge',
        onMessageReceived: (JavascriptMessage message) {
          debugPrint("js调用flutter，参数： ${message.message}");
        });
  }
}
