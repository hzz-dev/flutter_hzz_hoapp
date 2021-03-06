import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/log_utils.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  /// 初始化控制器
  PageController pageController;

  //PageView当前显示页面索引
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    //创建控制器的实例
    pageController = new PageController(
      //用来配置PageView中默认显示的页面 从0开始
      initialPage: 0,
      //为true是保持加载的每个页面的状态
      keepPage: true,
    );

    ///PageView设置滑动监听
    pageController.addListener(() {
      //PageView滑动的距离
      double offset = pageController.offset;
      //当前显示的页面的索引
      double page = pageController.page;
      LogUtils.e("pageView 滑动的距离 $offset  索引 $page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView "),
      ),
      body: Container(
        height: 200,
        child: PageView.builder(
          //当页面选中后回调此方法
          //参数[index]是当前滑动到的页面角标索引 从0开始
          onPageChanged: (int index) {
            print("当前的页面是 $index");
            currentPage = index;
          },
          //值为flase时 显示第一个页面 然后从左向右开始滑动
          //值为true时 显示最后一个页面 然后从右向左开始滑动
          reverse: false,
          //滑动到页面底部无回弹效果
          physics: BouncingScrollPhysics(),
          //纵向滑动切换
          scrollDirection: Axis.vertical,
          //页面控制器
          controller: pageController,
          //所有的子Widget
          itemBuilder: (BuildContext context, int index) {
            return Container(
              //缩放的图片
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          //
          if (currentPage > 0) {
            //滚动到上一屏
            pageController.animateToPage(
              currentPage - 1,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            );
          }
        },
      ),
    );
  }

  void pageViewController() {
    //动画的方式滚动到指定的页面
    pageController.animateToPage(
      //子Widget的索引
      0,
      //动画曲线
      curve: Curves.ease,
      //滚动时间
      duration: Duration(milliseconds: 200),
    );

    //动画的方式滚动到指定的位置
    pageController.animateTo(
      100,
      //动画曲线
      curve: Curves.ease,
      //滚动时间
      duration: Duration(milliseconds: 200),
    );

    //无动画切换到指定的页面
    pageController.jumpToPage(0);
    //无动画 切换到指定的位置
    pageController.jumpTo(100);
  }
}
