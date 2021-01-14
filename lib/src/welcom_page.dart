import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/welcom_time_widget.dart';
import 'package:flutter_hzz_hoapp/src/welcom_video_widget.dart';

///倒计时页面
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    //全屏展示
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              //第一层 背景 可以是一个图片
              //也可以是一个视频播放
              Positioned.fill(
                child: Hero(
                  tag: "welcom1",
                  child: Material(
                    color: Colors.transparent,
                    child: WelcomeVideoWidget(),
                  ),
                ),
              ),
              //第二层就是倒计时功能
              //右下角对齐
              Positioned(
                child: WelcomeTimeWidget(),
                right: 20,
                bottom: 66,
              )
            ],
          )),
    );
  }
}
