import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/home/list_item2_widget.dart';
import 'package:flutter_hzz_hoapp/src/home/list_item_widget.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/log_utils.dart';
import 'package:video_player/video_player.dart';

class HomeItemPage extends StatefulWidget {
// 标识当前子页面
  final int flag;
  HomeItemPage(this.flag);

  @override
  _HomeItemPageState createState() => _HomeItemPageState();
}

class _HomeItemPageState extends State<HomeItemPage> {
  //创建一个多订阅流
  StreamController<VideoPlayerController> _streamController =
      StreamController.broadcast();
  //当前播放视频的控制器
  VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    //添加一个消息监听
    _streamController.stream.listen((event) {
      LogUtils.e("接收到消息 ${event.textureId}");
      if (_videoPlayerController != null &&
          _videoPlayerController.textureId != event.textureId) {
        _videoPlayerController.pause();
      }
      _videoPlayerController = event;
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  bool _isScroll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,
      // NotificationListener监听滑动事件
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          Type runtimType = notification.runtimeType;

          LogUtils.e("runtimType $runtimType");
          if (runtimType == ScrollStartNotification) {
            LogUtils.e("开始滑动");
            _isScroll = true;
          } else if (runtimType == ScrollEndNotification) {
            LogUtils.e("结束滑动");
            _isScroll = false;
            setState(() {});
          }

          return false;
        },
        child: ListView.builder(
          //缓存距离为0
          cacheExtent: 0,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return buildListItemFungion();
          },
        ),
      ),
    );
  }

  Widget buildListItemFungion() {
    if (widget.flag == 1) {
      return ListViewItemWidget(
        isScroll: _isScroll,
        streamController: _streamController,
      );
    } else {
      return ListViewItem2Widget(
        isScroll: _isScroll,
        streamController: _streamController,
      );
    }
  }
}
