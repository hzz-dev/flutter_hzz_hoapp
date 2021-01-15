import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echart/flutter_echart.dart';

main() {
  runApp(MaterialApp(
    home: DemoPiePage(),
  ));
}

class DemoPiePage extends StatefulWidget {
  @override
  _DemoPiePageState createState() => _DemoPiePageState();
}

class _DemoPiePageState extends State<DemoPiePage> {
  List<EChartPieBean> _dataList = [
    EChartPieBean(title: "生活费", number: 29, color: Colors.lightBlueAccent),
    EChartPieBean(title: "游玩费", number: 20, color: Colors.deepOrangeAccent),
    EChartPieBean(title: "交通费", number: 400, color: Colors.green),
    EChartPieBean(title: "贷款费", number: 300, color: Colors.amber),
    EChartPieBean(title: "电话费", number: 200, color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("饼图"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Center(child: Container(height: 200, child: buildPieChatWidget())),
    );
  }

  PieChatWidget buildPieChatWidget() {
    return PieChatWidget(
      dataList: _dataList,
      //是否输出日志
      isLog: true,
      //是否需要背景
      isBackground: true,
      //是否画直线
      isLineText: true,
      //背景
      bgColor: Colors.white,
      //是否显示最前面的内容
      isFrontgText: true,
      //默认选择放大的块
      initSelect: 1,
      //初次显示以动画方式展开
      openType: OpenType.ANI,
      //旋转类型
      loopType: LoopType.DOWN_LOOP,
      //点击回调
      clickCallBack: (int value) {
        print("当前点击显示 $value");
      },
    );
  }
}
