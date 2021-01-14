import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/play/video_details2_widget.dart';


class ListViewItem2Widget extends StatefulWidget {
  final StreamController streamController;
  final isScroll;

  ListViewItem2Widget({this.streamController, this.isScroll = false});

  @override
  _ListViewItem2WidgetState createState() => _ListViewItem2WidgetState();
}

class _ListViewItem2WidgetState extends State<ListViewItem2Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Container(
        height: 220,
        child: buildVideoWidget(),
      ),
    );
  }

  Widget buildVideoWidget() {
    if (widget.isScroll) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/welcome.png",
          fit: BoxFit.fitWidth,
        ),
      );
    }
    return VideoDetails2Widget(
      streamController: widget.streamController,
    );
  }
}
