import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItemPage extends StatefulWidget {
// 标识当前子页面
  final int flag;
  HomeItemPage(this.flag);

  @override
  _HomeItemPageState createState() => _HomeItemPageState();
}

class _HomeItemPageState extends State<HomeItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Text("${widget.flag}"),
      ),
    );
  }
}
