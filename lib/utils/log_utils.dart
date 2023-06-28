import 'package:flutter/foundation.dart';

/// 输出Log工具类
class Log {
  static d(Object msg, {eventName = 'LOG', action = '   d   '}) {
    _print(msg, eventName: eventName, action: action);
  }

  static i(String msg, {eventName = 'LOG', action = '   i   '}) {
    _print(msg, eventName: eventName, action: action);
  }

  static e(String msg, {eventName = 'LOG', action = '   e   '}) {
    _print(msg, eventName: eventName, action: action);
  }

  static json(String msg, {eventName = 'LOG', action = '   v   '}) {
    _print(msg, eventName: eventName, action: action);
  }

  static _print(Object? msg, {eventName = 'S-LOG', action = '   v   '}) {
    /// 单元测试不必初始化Log工具类，直接使用print输出。
    if (kDebugMode && msg != null) {
      String message = msg.toString();
      if (message.isNotEmpty && message.length > 512) {
        debugPrint("$eventName $action ${message.substring(0, 512)}");
        message = message.substring(512, message.length);
        while (message.isNotEmpty) {
          if (message.length > 512) {
            debugPrint(message.substring(0, 512));
            message = message.substring(512, message.length);
          } else {
            debugPrint(message.toString());
            message = "";
          }
        }
      } else {
        debugPrint("$eventName $action $message");
      }
    }
  }

  static info(String info, {String eventName = 'INFO-LOG', String action = '', Map<String, dynamic>? properties}) {
    d(info, eventName: eventName, action: action);

    postLogService(info, eventName: eventName, action: action, properties: properties, level: 'INFO');
  }

  static error(String error, {String eventName = 'ERROR-LOG', String action = '', Map<String, dynamic>? properties}) {
    e(error, eventName: eventName, action: action);

    postLogService(error, eventName: eventName, action: action, properties: properties, level: 'ERROR');
  }

  static void postLogService(String error,
      {String eventName = '', String action = '', Map<String, dynamic>? properties, String? level}) {
    properties ??= {};
    properties['level'] = level;
    properties['eventName'] = eventName;
    properties['action'] = action;
    properties['content'] = error;
    properties['datetime'] = DateTime.now().toString();
  }
}
