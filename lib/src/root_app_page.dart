import 'package:flutter/material.dart';
import 'index_page.dart';

class RootApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootAPPState();
  }
}

class _RootAPPState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 去掉debug标签
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}
