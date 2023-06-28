import 'dart:async';
import 'package:diary/common.dart';
import 'package:flutter/material.dart';
import 'front_page.dart';

///启动页
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int index = 2;
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
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 25.w),
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffF0D9EA), Color(0xffE9F5FE)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('生\n活\n的\n美\n好',
                    style:
                        TextStyle(color: Colors.black, fontSize: 50.sp, fontFamily: 'mo', fontWeight: FontWeight.w400)),
                Padding(
                  padding: EdgeInsets.only(top: 30.w, left: 25.w, right: 25.w),
                  child: Text("是\n闻\n一\n朵\n花\n香",
                      style: TextStyle(
                          color: Colors.black, fontSize: 50.sp, fontFamily: 'mo', fontWeight: FontWeight.w400)),
                ),
                Text("见\n一\n见\n太\n阳",
                    style:
                        TextStyle(color: Colors.black, fontSize: 50.sp, fontFamily: 'mo', fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Positioned(
              top: 40,
              right: 20,
              child: Container(
                width: 50,
                height: 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xffC9E3E7).withOpacity(0.4), borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "$index",
                  style: const TextStyle(color: Color(0xffD3BCE8)),
                ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff4D87C4), Color(0xffF09C2B)],
                  ),
                ),
                width: double.infinity,
                height: double.infinity,

                child:      Center(
                  child: Text("梦\n想",
                      style: TextStyle(
                          color: Colors.black, fontSize: 100.sp, fontFamily: 'xingshu', fontWeight: FontWeight.w400)),
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff4D87C4), Color(0xffF09C2B)],
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text("记\n录",
                        style: TextStyle(
                            color: Colors.black, fontSize: 100.sp, fontFamily: 'xingshu', fontWeight: FontWeight.w400)),
                  )),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff4D87C4), Color(0xffF09C2B)],
                        //    colors: [Color(0xffF8C8A7), Color(0xff7FEC74)],
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text("生\n活",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 100.sp,
                              fontFamily: 'xingshu',
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FrontPage()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                               colors: [Color(0xff7EAFE0),Color(0xffF09C2B),Color(0xff7EAFE0),],
                           //   colors: [Color(0xffF8C8A7), Color(0xff7FEC74)],
                            ),
                          ),
                          child: const Text("欢迎使用心情日记>"),
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
                    selectedColor: const Color(0xff7EAFE0),
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
