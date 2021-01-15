import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/demo/banner_widget.dart';
import 'package:flutter_hzz_hoapp/src/demo/home_item_tabbar_page.dart';

class HomeItemDemoPage extends StatefulWidget {
  @override
  _HomeItemDemoPageState createState() => _HomeItemDemoPageState();
}

class _HomeItemDemoPageState extends State<HomeItemDemoPage>
    with SingleTickerProviderStateMixin {
  List<String> _list = [
    "assets/images/welcome.png",
    "assets/images/welcome.png",
    "assets/images/welcome.png",
    "assets/images/welcome.png",
    "assets/images/welcome.png"
  ];

  double _headerOpacity = 0.0;

  //滑动控制器
  ScrollController _scrollController = new ScrollController();

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      //获取滑动的距离
      double offset = _scrollController.offset;

      if (offset <= 160) {
        _headerOpacity = offset / 160;
        setState(() {});
      }
    });

    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///填充布局
      body: NestedScrollView(
        //绑定滑动控制器
        controller: _scrollController,
        //主体内容
        body: buildBody(),
        //头部
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            //折叠
            SliverAppBar(
              //值为true时 是否停留
              pinned: true,
              //标题会停留
              title: Opacity(
                  opacity: _headerOpacity,
                  child: Text(
                    "Demo目录 ",
                    style: TextStyle(color: Colors.white),
                  )),
              //展开的高度
              expandedHeight: 244,
              //可折叠隐藏的部分
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 200,
                  child: BannerWidget(
                    imageList: _list,
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 44),
                child: Material(
                  color: Colors.white,
                  child: TabBar(
                    //下划线的颜色
                    indicatorColor: Colors.blueGrey,
                    labelColor: Colors.blueGrey,
                    //下划线的宽度
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: "推荐",
                      ),
                      Tab(
                        text: "热点",
                      ),
                      Tab(
                        text: "分类",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
      ),
    );
  }

  buildBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        HomeItemTabbarPage(),
        HomeItemTabbarPage(),
        HomeItemTabbarPage()
      ],
    );
  }
}
