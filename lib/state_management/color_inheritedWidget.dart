import 'package:flutter/material.dart';

class ColorInheritedWidget extends InheritedWidget {
  /// 构造方法
  const ColorInheritedWidget({Key? key, required this.color,
    required Widget child}):super(key:key, child: child);

  /// 需要共享的数据
  final Color color  ;

  /// 默认的约定：如果状态是希望暴露出的，应当提供一个`of`静态方法来获取其对象，开发者便可直接通过该方法来获取
  /// 返回实例对象，方便子树中的widget获取共享数据
  static ColorInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorInheritedWidget>();
  }

  /// 是否通知widget树中依赖该共享数据的子widget
  /// 这里当color发生变化时，是否通知子树中所有依赖color的Widget重新build
  @override
  bool updateShouldNotify(covariant ColorInheritedWidget oldWidget) {
    return color != oldWidget.color;
  }
}







