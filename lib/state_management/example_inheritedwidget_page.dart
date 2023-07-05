import 'package:diary/common.dart';
import 'package:diary/state_management/poetry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'color_inheritedWidget.dart';

class ExampleInheritedWidgetPage extends StatefulWidget {
  const ExampleInheritedWidgetPage({Key? key}) : super(key: key);

  @override
  State<ExampleInheritedWidgetPage> createState() => _ExampleInheritedWidgetPageState();
}

class _ExampleInheritedWidgetPageState extends State<ExampleInheritedWidgetPage> {
  Color color = Color(0xff158654);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorInheritedWidget(
        color: color,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: DeviceUtils.navigationBarHeight(context) + 100.w,
              ),
              Center(
                  child: Text(
                "诗颜色状态的更新",
                style: TextStyle(fontSize: 40.sp, fontFamily: "xingshu", fontWeight: FontWeight.w500),
              )),
              SizedBox(
                height: 15.w,
              ),
              const PoetryOneWidget(),
              const PoetryTwoWidget(),
              SizedBox(
                height: 50.w,
              ),
              GestureDetector(
                onTap: () {
                  if (!mounted) return;
                  _selectColor(context);
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
                    '更改颜色',
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, fontFamily: "mo"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectColor(BuildContext context) async {
    Color initColor = Theme.of(context).primaryColor;

    final Color newColor = await showColorPickerDialog(
      context,
      initColor,
      title: Text("颜色选择器", style: Theme.of(context).textTheme.titleLarge),
      width: 40,
      height: 40,
      spacing: 0,
      runSpacing: 0,
      borderRadius: 0,
      wheelDiameter: 165,
      enableOpacity: true,
      showColorCode: true,
      colorCodeHasColor: true,
      pickersEnabled: <ColorPickerType, bool>{
        ColorPickerType.wheel: true,
      },
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      actionButtons: const ColorPickerActionButtons(
        okButton: true,
        closeButton: true,
        dialogActionButtons: false,
      ),
      constraints: const BoxConstraints(minHeight: 480, minWidth: 320, maxWidth: 320),
    );

    setState(() {
      color = newColor;
    });
  }
}

///跨页面的话
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ExampleInheritedWidgetPage(
//      color:Colors.black,
//       child: MaterialApp(
//         home:  FirstPage(),
//       ),
//     );
//   }
// }