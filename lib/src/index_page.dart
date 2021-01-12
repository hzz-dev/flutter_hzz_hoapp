import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'pages/common/permisson_request_widget.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

// WidgetsBindingObserver添加观察者 处理去设置中心或跳出app前后台切换
class _IndexPageState extends State with WidgetsBindingObserver {
  List<String> _list = [
    "为您更好的体验应用,所以需要或您的手机文件存储权限,以保存您的一些偏好设置",
    "您已拒绝权限,所以无法保存您的一些偏好设置,讲无法使用APP",
    "您已拒绝权限,请在设置中心中同意APP的权限请求",
    "其他错误"
  ];

  // 页面初始化函数 页面创建时会执行
  @override
  void initState() {
    super.initState();

    // 延时0秒 放到队列里面
    Future.delayed(Duration.zero, () {
      // 使用动态路由
      Navigator.of(context)
          .push(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return PermissionRequestWidget(
                  permission: Permission.camera, permissionList: _list);
            }),
      )
          .then((value) {
        if (value == null || value == false) {
          // 权限请求不通过
        } else {
          // 权限请求通过

        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('启动'),
      // ),
      body: Center(
        child: Image.asset(
          'assets/images/app_icon.png',
          width: 66,
          height: 66,
        ),
      ),
    );
  }
}
