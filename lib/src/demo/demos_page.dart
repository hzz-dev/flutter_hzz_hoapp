import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hzz_hoapp/src/demo/demo_scroll_index_list.dart';
import 'package:flutter_hzz_hoapp/src/demo/shuibo_page.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/navigator_utils.dart';

class DemosPage extends StatefulWidget {
  @override
  _DemosPageState createState() => _DemosPageState();
}

class _DemosPageState extends State<DemosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [buildScollIndexWidget(), buildShuibowenWidget()],
      ),
    );
  }

  ListTile buildScollIndexWidget() {
    return ListTile(
      //显示标题
      title: Text("ScollIndexPage"),
      //右侧按钮
      trailing: Icon(Icons.arrow_forward_ios),
      //左侧箭头
      leading: Icon(Icons.wallet_giftcard),
      //点击事件
      onTap: () {
        NavigatorUtils.pushPage(context: context, targPage: ScrollIndexPage());
      },
    );
  }

  ListTile buildShuibowenWidget() {
    return ListTile(
      //显示标题
      title: Text("水波纹效果"),
      //右侧按钮
      trailing: Icon(Icons.arrow_forward_ios),
      //左侧箭头
      leading: Icon(Icons.water_damage_sharp),
      //点击事件
      onTap: () {
        NavigatorUtils.pushPage(context: context, targPage: ShuiBoWenPage());
      },
    );
  }
}
