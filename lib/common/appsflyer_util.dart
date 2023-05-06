import 'dart:convert';

import 'package:native_web/common/Global.dart';

logEventToAF(List<dynamic> arguments) {
  if (arguments.isEmpty) {
    return;
  }
  Global.sdk?.logEvent(
      arguments[0], arguments.length > 1 ? json.decode(arguments[1]) : {});
}
