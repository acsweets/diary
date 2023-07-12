import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TaskState {
  initial,
  loading,
  error,
}



int _counter = 0;
TaskState _state = TaskState.initial;

void _doIncrementTask() async {
  renderLoading();
  // 模拟异步任务
  await Future.delayed(const Duration(seconds: 2));
  _counter++;
  renderLoaded();
}

void renderLoading() {
  // setState(() {
    _state = TaskState.loading;
  // });
}

void renderLoaded() {
  // setState(() {
    _state = TaskState.initial;
  // });
}

//任务的三个状态返回不同的组件
Widget buildButtonByState(TaskState state) {
  VoidCallback? onPressed;
  Color color;
  Widget child;

  switch (state) {
    //正常
    case TaskState.initial:
      child = const Icon(Icons.add);
      onPressed = _doIncrementTask;
      color = Colors.cyan;
      break;
    case TaskState.loading:
      child = const CupertinoActivityIndicator(color: Colors.white);
      color = Colors.grey;
      onPressed = null;
      break;
    case TaskState.error:
      child = const Icon(Icons.refresh);
      color = Colors.red;
      onPressed = renderLoaded;
      break;
  }
  return FloatingActionButton(
    backgroundColor: color,
    onPressed: onPressed,
    child: child,
  );
}
