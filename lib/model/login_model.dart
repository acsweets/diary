import 'package:flutter/cupertino.dart';

import '../common.dart';

class LoginModel extends BaseModel {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  LoginModel() {
    usernameController = TextEditingController()
      ..addListener(() {
        notifyListeners();
      });

    passwordController = TextEditingController()
      ..addListener(() {
        notifyListeners();
      });
  }

  void login() {
    Map<String, dynamic>? params = {};
    params["username"] = usernameController.text;
    params["password"] = passwordController.text;

    Api.userLogin(params: params).then((value) => {
          if (value != null)
            {
              BotToast.showText(
                text: '欢迎${value.userName}登录',
                duration: const Duration(seconds: 2),
              ),
              NavigatorUtil.goNewPage(context, const FrontPage(), replace: true)
            }
          else
            {BotToast.showText(text: '登录失败', duration: Duration(seconds: 2))}
        });
  }
}
