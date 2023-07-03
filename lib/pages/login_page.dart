
import 'package:flutter/material.dart';

import '../common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(child: Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: Image.asset("assets/images/backgroundImage.png",fit: BoxFit.fitWidth,),
        ),),
        Positioned(
          left: 20.w,
          right: 20.w,
          top: 120.w +DeviceUtils.navigationBarHeight(context),
          child: Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(20.w),
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
            child:  Column(
              children: [
                Text("欢迎登录",style:  TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500,fontFamily: "mo"),),
                SizedBox(height: 15.w,),
                const TextField(
                  decoration: InputDecoration(
                    labelText: '账号',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20.w),  // 添加间距
                const TextField(
                  decoration: InputDecoration(
                    labelText: '密码',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  obscureText: true,  // 隐藏密码
                ),
                SizedBox(height: 25.w),
                GestureDetector(
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
                    child: Text('登录',style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500,fontFamily: "mo"),),
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
            bottom: 150.w +DeviceUtils.bottomSafeHeight(context),
            child: GestureDetector(
              onTap: (){
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
                  child: Text('游客访问',style: TextStyle(fontSize:24.sp
                      ,fontFamily: "mo"),)),
            ))
      ]),
    );
  }
}
