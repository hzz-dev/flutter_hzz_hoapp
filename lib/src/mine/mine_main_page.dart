import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hzz_hoapp/src/mine/mine_login_page.dart';
import 'package:flutter_hzz_hoapp/src/mine/mine_no_login_page.dart';
import 'package:flutter_hzz_hoapp/src/pages/common/controller.dart';
import 'package:flutter_hzz_hoapp/src/pages/common/user_helper.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/navigator_utils.dart';

class MineMainPage extends StatefulWidget {
  @override
  _MineMainPageState createState() => _MineMainPageState();
}

class _MineMainPageState extends State<MineMainPage> {
  @override
  void initState() {
    super.initState();
    //Stream 监听
    //用来远程通知当前页面刷新 目前在登录页面有使用
    loginStreamController.stream.listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //设置状态栏
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //iOS中状态栏文字为白色
        statusBarBrightness: Brightness.dark,
        //设置安卓的状态栏颜色
        statusBarColor: Color(0XffCDDEEC),
      ),
      child: Stack(
        children: [
          //主内容区域
          Positioned.fill(
            child: buildMainBody(),
          ),
          //右上角的设置按钮
          Positioned(
            top: 44,
            right: 16,
            child: buildSettingButton(context),
          )
        ],
      ),
    );
  }

  IconButton buildSettingButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings_applications_outlined),
      onPressed: () {
        NavigatorUtils.pushPage(
          context: context,
          //目标页面
          // targPage: SettingPage(),
          //关闭设置页面的回调
          dismissCallBack: (value) {
            if (value != null) {
              setState(() {});
            }
          },
        );
      },
    );
  }

  buildMainBody() {
    //判断用户是否已登录
    if (UserHepler.getInstance.isLogin) {
      //构建已登录的页面
      return MineLoginPage();
    } else {
      //构建未登录的页面
      return MineNoLoginPage();
    }
  }

  @override
  void dispose() {
    loginStreamController.close();
    super.dispose();
  }
}
