import 'dart:async';
import 'package:flutter/material.dart';
import 'front_page.dart';

///启动页
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int index = 4;
  late Timer _timer;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (index > 0) {
          index--;
        } else {
          //跳转到引导页面
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GuidePage()),
          );
          index = 0;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.cyan,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              top: 40,
              right: 20,
              child: Container(
                width: 50,
                height: 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(40)),
                child: Text("${index}"),
              ))
        ],
      ),
    );
  }
}

class GuidePage extends StatefulWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  bool isVisible = true;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _tabController?.addListener(() {
      if (_tabController?.index == 2) {
        setState(() {
          isVisible = false;
        });
      } else {
        setState(() {
          isVisible = true;
        });
      }
    });
  }

  final List<Widget> listImage = [
    Container(
      color: Colors.green,
      width: double.infinity,
      height: double.infinity,
    ),
    Container(
      color: Colors.indigoAccent,
      width: double.infinity,
      height: double.infinity,
    ),
    Container(
      color: Colors.deepPurple,
      width: double.infinity,
      height: double.infinity,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              listImage[0],
              listImage[1],
              Stack(
                children: [
                  listImage[2],
                  Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FrontPage()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(40)),
                          child: const Text("欢迎使用心情日记"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Visibility(
              visible: isVisible,
              child: Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TabPageSelector(
                    controller: _tabController,
                    selectedColor: Colors.amberAccent,
                    indicatorSize: 17,
                    color: Colors.black12,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
