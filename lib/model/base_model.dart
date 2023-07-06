///感觉最近都没什么脑子，无奈
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier{

  BuildContext? context;

  ///设置下上下文
  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
    }
  }
}