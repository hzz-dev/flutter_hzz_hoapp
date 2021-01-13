import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hzz_hoapp/src/pages/common/protocol_model.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/log_utils.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/navigator_utils.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/sp_utils.dart';
import 'package:flutter_hzz_hoapp/src/welcom_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'pages/common/permisson_request_widget.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

// WidgetsBindingObserver添加观察者 处理去设置中心或跳出app前后台切换
// class _IndexPageState extends State with WidgetsBindingObserver

// 通过with关键字讲ProtocolModel混入 类似多继承
class _IndexPageState extends State with ProtocolModel {
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
      initData();

      // // 使用动态路由
      // Navigator.of(context)
      //     .push(
      //   PageRouteBuilder(
      //       opaque: false,
      //       pageBuilder: (BuildContext context, Animation<double> animation,
      //           Animation<double> secondaryAnimation) {
      //         return PermissionRequestWidget(
      //             permission: Permission.camera, permissionList: _list);
      //       }),
      // )
      //     .then((value) {
      //   if (value == null || value == false) {
      //     // 权限请求不通过
      //   } else {
      //     // 权限请求通过

      //   }
      // });
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

  void initData() {
    //当前应用的运行环境
    //当App运行在release环境时
    bool isLog = !bool.fromEnvironment("dart.vm.product");
    LogUtils.init(islog: isLog);

    LogUtils.e("权限申请");
    //权限申请
    NavigatorUtils.pushPageByFade(
        context: context,
        //目标页面
        targPage: PermissionRequestWidget(
          //所需要申请的权限
          permission: Permission.camera,
          //显示关闭应用按钮
          isCloseApp: true,
          //提示文案
          permissionList: _list,
        ),
        //权限申请结果
        dismissCallBack: (value) {
          //插值
          LogUtils.e("权限申请结果 $value");
          initDataNext();
        });
  }

  //初始化工具类
  void initDataNext() async {
    // isAgrement标识存储的路径
    if (Platform.isIOS) {
      Directory libDire = await getLibraryDirectory();
      LogUtils.e("libDire ${libDire.path}");
    }
    //初始化
    await SPUtil.init();
    //读取一下标识
    bool isAgrement = await SPUtil.getBool("isAgrement");
    LogUtils.e("isAgrement $isAgrement");
    if (isAgrement == null || !isAgrement) {
      isAgrement = await showProtocolFunction(context);
    }

    if (isAgrement) {
      //同意
      LogUtils.e("同意协议");
      //保存一下标识
      SPUtil.save("isAgrement", true);
      next();
    } else {
      LogUtils.e("不同意");
      closeApp();
    }
  }

  void closeApp() {
    //关闭应用的方法
    SystemChannels.platform.invokeMethod("SystemNavigator.pop");
  }

  void next() {
    //引导 页面

    //倒计时页面
    NavigatorUtils.pushPageByFade(
        context: context, targPage: WelcomePage(), isReplace: true);
  }
}
