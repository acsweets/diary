import 'package:flutter/material.dart';

import '../common.dart';

class NewLoginPage extends StatefulWidget {
  const NewLoginPage({Key? key}) : super(key: key);

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  late LoginModel model;

  @override
  void initState() {
    model = LoginModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderViewWidget<LoginModel>(
      model: model,
      builder: (BuildContext context, LoginModel model, Widget? child) {
        return Scaffold(
          body: Stack(children: [
            Positioned.fill(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/backgroundImage.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              left: 20.w,
              right: 20.w,
              top: 120.w + DeviceUtils.navigationBarHeight(context),
              child: Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: Colors.white, // 盒子的颜色
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 阴影的颜色
                      spreadRadius: 5, // 阴影的扩散范围
                      blurRadius: 7, // 阴影的模糊程度
                      offset: const Offset(0, 3), // 阴影的位置
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "欢迎登录",
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: "mo"),
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: model.usernameController,
                      decoration: InputDecoration(
                        labelText: '账号',
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        suffixIcon: GestureDetector(
                            child: Offstage(
                                offstage: model.usernameController!.text == '', child: const Icon(Icons.clear)),
                            //点击清除文本框内容
                            onTap: () {
                              setState(() {
                                model.usernameController!.clear();
                              });
                            }),
                      ),
                      obscureText: false, // 隐藏密码
                    ),
                    SizedBox(height: 20.w), // 添加间距
                    TextField(
                      controller: model.passwordController,
                      decoration: InputDecoration(
                        labelText: '密码',
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        suffixIcon: GestureDetector(
                            child: Offstage(
                                offstage: model.passwordController.text == '',
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.cyan,
                                )),
                            //点击清除文本框内容
                            onTap: () {
                              setState(() {
                                model.passwordController.clear();
                              });
                            }),
                      ),
                      obscureText: true, // 隐藏密码
                    ),
                    SizedBox(height: 25.w),
                    GestureDetector(
                      onTap: () {
                        model.login();
                      },
                      child: Container(
                        width: 200.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffF4ABA3),
                              Color(0xff6EA9FF),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        child: Text(
                          '登录',
                          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: "mo"),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.w),
                  ],
                ),
              ),
            ),
            Positioned(
                left: 20.w,
                right: 20.w,
                top: 150.w + DeviceUtils.height(context) / 2,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigatorUtil.goNewPage(context, const FrontPage());
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 35.w),
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            '游客访问',
                            style: TextStyle(fontSize: 24.sp, fontFamily: "mo"),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigatorUtil.goNewPage(context, const RegisterPage());
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 25.w, horizontal: 35.w),
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            '注册',
                            style: TextStyle(fontSize: 24.sp, fontFamily: "mo"),
                          )),
                    ),
                  ],
                ))
          ]),
        );
      },
    );
  }
}
