
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier{

  BuildContext? context;


  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
    }
  }

}