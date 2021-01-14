import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/home_page.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/log_utils.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/navigator_utils.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/sp_utils.dart';



class FirstGuildPage extends StatefulWidget {
  @override
  _FirstGuildPageState createState() => _FirstGuildPageState();
}

class _FirstGuildPageState extends State<FirstGuildPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //第一层的图片
          buildBackground(width, height),
          //第二层的点指示
          buildIndfot(),
          //第三层的去首页
          buildGoHome(),
        ],
      ),
    );
  }

  Positioned buildGoHome() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            height: _currentIndex == 3 ? 44 : 0,
            width: _currentIndex == 3 ? 180 : 0,
            child: ElevatedButton(
              child: Text("去首页"),
              onPressed: () {
                LogUtils.e("点击了去首页面");
                SPUtil.save("flutter_hzz_isFirst",true);
                NavigatorUtils.pushPageByFade(
                  context: context,
                  targPage: HomePage(),
                  isReplace: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildIndfot() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buidlIndefot(_currentIndex == 0),
          buidlIndefot(_currentIndex == 1),
          buidlIndefot(_currentIndex == 2),
          buidlIndefot(_currentIndex == 3),
        ],
      ),
    );
  }

  Widget buidlIndefot(bool isSelect) {
    return AnimatedContainer(
      height: 12,
      width: isSelect ? 40 : 12,
      margin: EdgeInsets.only(left: 16),
      duration: Duration(milliseconds: 800),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  Positioned buildBackground(double width, double height) {
    return Positioned.fill(
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: [
          Image.asset(
            "assets/images/sp01.png",
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            "assets/images/sp02.png",
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            "assets/images/sp03.png",
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            "assets/images/sp05.png",
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
