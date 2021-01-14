import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/home/home_item_page.dart';
import 'package:flutter_hzz_hoapp/src/mine/mine_main_page.dart';

// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //当前选中的标识
  int _currentIndex = 0;
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: _pageController,
          //不可左右滑动
          physics: NeverScrollableScrollPhysics(),
          children: [
            // //第一个视频列表播放页面
            // HomeItemPage(1),
            // //第二个视频列表播放页面
            // HomeItemDemoPage(),
            // //第三个视频列表播放页面
            // HomeItemPage(2),
            // //第四个文章列表页面
            // HomeItem3Page(),
            // //第五个个人中心页面
            // MineMainPage(),
            HomeItemPage(1),
            HomeItemPage(2),
            HomeItemPage(3),
            HomeItemPage(4),
            MineMainPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //当前选中的Item 默认为 0
        currentIndex: _currentIndex,
        //点击回调
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
            _pageController.jumpToPage(value);
          });
        },
        //显示文字
        type: BottomNavigationBarType.fixed,
        //选中的颜色
        selectedItemColor: Colors.redAccent,
        //未选中颜色
        unselectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "DEMO"),
          BottomNavigationBarItem(icon: Icon(Icons.five_g), label: "发现"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
    );
  }
}
