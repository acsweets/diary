import 'package:flutter/cupertino.dart';

class ColorModel extends ChangeNotifier {
  ///主题色
  Color themeColor = const Color(0xff146996);

  ///更新主题色
  void updateTheme(Color color) {
    themeColor = color;
    notifyListeners();
  }
}
