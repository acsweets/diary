import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common.dart';

class ProviderViewWidget<T extends BaseModel> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final T model;
  const ProviderViewWidget({Key? key, required this.model, required this.builder}) : super(key: key);

  @override
  State<ProviderViewWidget> createState() => _ProviderViewWidgetState<T>();
}

class _ProviderViewWidgetState<T extends BaseModel> extends State<ProviderViewWidget<T>> {
  T ? model;
  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model!.setContext(context);
    return ChangeNotifierProvider<T?>.value(
        value: model,
        child: Consumer<T>(builder: (BuildContext context, T value, Widget? child) {
          return widget.builder(context, value, child);
        }));
  }
}
