import 'package:flutter/material.dart';

import 'color_inheritedWidget.dart';

class PoetryOneWidget extends StatelessWidget {

  const PoetryOneWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Text("纸上得来终觉浅",style:  TextStyle(fontSize: 24,color: ColorInheritedWidget.of(context)!.color,fontFamily: "mo"),),
    );
  }
}
class PoetryTwoWidget extends StatefulWidget {
  const PoetryTwoWidget({Key? key}) : super(key: key);
  @override
  State<PoetryTwoWidget> createState() => _PoetryTwoWidgetState();
}

class _PoetryTwoWidgetState extends State<PoetryTwoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Text("百闻不如一见",style:  TextStyle(fontSize: 24,color: ColorInheritedWidget.of(context)!.color,fontFamily:  "mo"),),
    );
  }
}


