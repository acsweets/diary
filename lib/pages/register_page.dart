import 'package:diary/common.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: DeviceUtils.navigationBarHeight(context)+200.w,
            ),
            Text(
              "注册",
              style: TextStyle(fontSize: 24.sp, fontFamily: "mo"),
            ),
            InputBoxWidget(
              icon: const Icon(Icons.email),
              hintText: "填写邮箱发送验证码",
              controller: emailController,
              suffixIcon:  GestureDetector(
                  child: const Icon(Icons.send,
                    color: Colors.cyan,),
                  onTap: () {
                    Api.sendEmail().then((value) => {
                      if(value!=null){
                        print("${value.msg}"),
                      }});
                  }),
            ),
            InputBoxWidget(
              icon: const Icon(Icons.confirmation_num),
              hintText: "邮箱验证码",
              controller: codeController,
            ),
            InputBoxWidget(
              icon: const Icon(Icons.account_circle_outlined),
              hintText: "昵称",
              controller: nameController,
            ),
            GestureDetector(
              onTap: () {
                Map<String, dynamic>? params={};
                params ["userName"] = nameController.text;
                params ["activeCode"] = codeController.text;
                params ["email"] = emailController.text;
                Api.userRegister(params: params).then((value) => {
               if(value!=null){
                 if(value.status!){
                   Log.d("${value.msg}"),
                   Navigator.pop(context),
                 }else{
                   Log.d("${value.msg}"),
                 }
               }

                });
              },
              child: Container(
                width: 200.w,
                height: 50.w,
                margin: EdgeInsets.only(top: 25.w),
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
                  '提交', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: "mo"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
