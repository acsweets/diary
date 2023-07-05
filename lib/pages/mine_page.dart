import 'package:diary/common.dart';
import 'package:flutter/material.dart';

import '../widget/image_picker.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '我的',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        // color: Colors.deepPurpleAccent,
        child: MediaQuery.removePadding(
          removeTop: true, //去掉导航栏的间隙
          context: context,
          child: ListView(
            children: [
              //头部
              GestureDetector(
                  onTap: () {
                    showCupertinoModalBottomSheet(context: context, builder: (_) => const ImagePickerWidget())
                        .then((value) {});
                  },
                  child: headerWidget()),
              //列表 cell
                        Column(
                  children: [
                  ])
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      height: 110,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(top: 0, bottom: 20, left: 10, right: 10),
        child: Row(children: [
          //头像
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(image: AssetImage("assets/images/mine.png"), fit: BoxFit.cover)),
          ),
          //昵称/微信号
          Container(
            width: 200.w,
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //昵称
                Container(
                  height: 35,
                  child: Text(
                    "RENO",
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                ),
                //微信号
                Container(
                  height: 35,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "微信号：12345",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      //   Image(image: AssetImage("images/icon_right.png"),width: 15,)
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
