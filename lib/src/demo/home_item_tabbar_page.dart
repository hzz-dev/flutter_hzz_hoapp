import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/log_utils.dart';

class HomeItemTabbarPage extends StatefulWidget {
  @override
  _HomeItemTabbarPageState createState() => _HomeItemTabbarPageState();
}

class _HomeItemTabbarPageState extends State<HomeItemTabbarPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    LogUtils.e("页面创建");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: 120,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 120,
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              //左侧
              buildLeftColumn(),
              SizedBox(
                width: 14,
              ),
              //右侧
              Column(
                children: [
                  Text(
                    "这里是标题",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "这里是简介",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "这里是时间",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Column buildLeftColumn() {
    return Column(
      children: [
        Container(
          width: 2,
          height: 8,
          color: Colors.blueGrey,
        ),
        ClipOval(
          child: Container(
            color: Colors.redAccent,
            width: 8,
            height: 8,
          ),
        ),
        Container(
          width: 2,
          height: 104,
          color: Colors.blueGrey,
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
