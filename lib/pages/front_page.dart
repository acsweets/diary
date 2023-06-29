import 'package:diary/common.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'journal_page.dart';
import 'mine_page.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int _selectedIndex = 0; // 用作被选中的 Tab 的索引号
  final List _tabPages = [
    const HomePage(),
    const JournalPage(),
    const MinePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 14.0,
        // 未被选中时的字体大小
        showSelectedLabels: false,
        // 被选中时是否显示Label
        showUnselectedLabels: false,
        // 未被选中时是否显示Label
        enableFeedback: true,
        //点击会产生咔嗒声，长按会产生短暂的振动
        selectedItemColor:const Color(0xffCADBE5),
        // 设置被选中时的图标颜色
        unselectedItemColor: const Color(0xff8486F8),
        // 设置未被选中时的图标颜色
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconFont.write, size: 30.w,color: Color(0xffFDE5B1),),
            label: '主页',
            activeIcon:Icon(IconFont.mine_active, size: 35.w,),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconFont.diary, size: 35.w,color: const Color(0xffF4C2FA),),
            label: '日记',
            activeIcon:Icon(IconFont.mine_active, size: 35.w,),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconFont.mine, size: 30.w,color: const Color(0xffA0DDDC),),
            activeIcon:Icon(IconFont.mine_active, size: 35.w,),
            label: '我的',
            backgroundColor: Colors.white,
          ),
        ],

        // 设置当前（即被选中时）页面
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
