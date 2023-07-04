import 'package:flutter/material.dart';

import '../common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });

    _passwordController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topCenter,
          child: Image.asset("assets/images/backgroundImage.png", fit: BoxFit.fitWidth,),
        ),),
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
                Text("欢迎登录", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: "mo"),),
                SizedBox(height: 15.w,),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '账号',
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    suffixIcon: GestureDetector(
                        child: Offstage(offstage: _usernameController.text == '', child: const Icon(Icons.clear)),
                        //点击清除文本框内容
                        onTap: () {
                          setState(() {
                            _usernameController.clear();
                          });
                        }),
                  ),
                  obscureText: false, // 隐藏密码
                ),
                SizedBox(height: 20.w), // 添加间距
                TextField(
                  decoration: InputDecoration(
                    labelText: '密码',
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    suffixIcon: GestureDetector(
                        child: Offstage(offstage: _passwordController.text == '', child: const Icon(Icons.clear,
                          color: Colors.cyan,)),
                        //点击清除文本框内容
                        onTap: () {
                          setState(() {
                            _passwordController.clear();
                          });
                        }),
                  ),
                  obscureText: true, // 隐藏密码
                ),
                SizedBox(height: 25.w),
                GestureDetector(
                  onTap: () {
                    Api.sendEmail().then((value) => {
                    if(value!=null){
                        print("${value.msg}"),
                  }});
                  },
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffF4ABA3), Color(0xff6EA9FF),],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Text(
                      '登录', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: "mo"),),
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
            top: 200.w + DeviceUtils.height(context) / 2,
            child: GestureDetector(
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
                  child: Text('游客访问', style: TextStyle(fontSize: 24.sp
                      , fontFamily: "mo"),)),
            ))
      ]),
    );
  }

  Widget _getInputTextField(TextInputType keyboardType,
      {FocusNode? focusNode,
        controller = TextEditingController,
        InputDecoration? decoration,
        bool obscureText = false,
        height = 50.0}) {
    return Container(
        height: height,
        margin: const EdgeInsets.all(10.0),
        child: Column(children: [
          TextField(
              keyboardType: keyboardType,
              focusNode: focusNode,
              obscureText: obscureText,
              controller: controller,
              decoration: decoration),
          Divider(height: 1.0, color: Colors.grey[400])
        ]));
  }

  Widget _getUsernameInput() {
    return _getInputTextField(TextInputType.number,
        controller: _usernameController,
        decoration: InputDecoration(
            hintText: "输入手机号",
            icon: const Icon(Icons.mobile_friendly_rounded, size: 20.0),
            border: InputBorder.none,
            //使用 GestureDetector 实现手势识别
            suffixIcon: GestureDetector(
                child: Offstage(offstage: _usernameController.text == '', child: const Icon(Icons.clear)),
                //点击清除文本框内容
                onTap: () {
                  setState(() {
                    _usernameController.clear();
                  });
                })));
  }

  Widget _getPasswordInput() {
    return _getInputTextField(TextInputType.text,
        obscureText: true,
        controller: _passwordController,
        decoration: InputDecoration(
            hintText: "输入密码",
            icon: const Icon(Icons.lock_open, size: 20.0),
            suffixIcon: GestureDetector(
                child: Offstage(offstage: _passwordController.text == '', child: const Icon(Icons.clear)),
                onTap: () {
                  setState(() {
                    _passwordController.clear();
                  });
                }),
            border: InputBorder.none));
  }

}
