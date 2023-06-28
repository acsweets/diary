import 'dart:io';
import 'package:flutter/material.dart';

import '../common.dart';

class NavigatorUtil {
  static final NavigatorUtil _singleton = NavigatorUtil._internal();

  NavigatorUtil._internal();

  factory NavigatorUtil() {
    return _singleton;
  }

  static Future goNewPage(BuildContext? context, Widget newPage,
      {bool fullscreenDialog = false, bool replace = false}) {
    DeviceUtils.hideKeyboard(context!);

    if (replace) {
      return Navigator.of(context).pushReplacement(
          MaterialWithModalsPageRoute(builder: (BuildContext context) => newPage, fullscreenDialog: fullscreenDialog));
    } else {
      return Navigator.of(context).push(
          MaterialWithModalsPageRoute(builder: (BuildContext context) => newPage, fullscreenDialog: fullscreenDialog));
    }
  }

  static Future goNewPageByRouteName(BuildContext context, String? routeName,
      {Map<String, dynamic>? arguments, bool replace = false}) {
    if (routeName != null && routeName.isNotEmpty) {
      if (replace) {
        return Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
      } else {
        return Navigator.of(context).pushNamed(routeName, arguments: arguments);
      }
    } else {
      return Future(() => null);
    }
  }
}
