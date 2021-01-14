import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hzz_hoapp/src/bean/bean_user.dart';
import 'package:flutter_hzz_hoapp/src/login/bg/bubble_widget.dart';
import 'package:flutter_hzz_hoapp/src/login/custom_textfield_widget.dart';
import 'package:flutter_hzz_hoapp/src/net/dio_utils.dart';
import 'package:flutter_hzz_hoapp/src/pages/common/controller.dart';
import 'package:flutter_hzz_hoapp/src/pages/common/user_helper.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/log_utils.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/toast_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //密码输入框焦点控制
  FocusNode _passwordFocusNode = new FocusNode();

  //手机号输入框焦点控制
  FocusNode _userNameFocusNode = new FocusNode();

  //手机号输入框控制器
  TextEditingController _userNameEditController = new TextEditingController();

  //密码输入框控制器
  TextEditingController _userPasswordEditController =
      new TextEditingController();

  //控制密码显示
  bool _passwordShow = true;

  @override
  void initState() {
    super.initState();
    //输入框预设内容
    _userNameEditController.text = "13387987456";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Container(
          width: double.infinity,
          height: double.infinity,
          //点击空白区域 隐藏键盘
          child: GestureDetector(
            onTap: () {
              _userNameFocusNode.unfocus();
              _passwordFocusNode.unfocus();
            },
            child: Stack(
              children: [
                //第一层 背景
                buildBackgroundWidget(),
                //第二层 气泡
                Positioned.fill(
                  child: BubbleWidget(),
                ),
                //第三层 高斯模糊
                buildFliterWidget(),
                //第四层 logo
                buildLogoWidget(),
                //第五层来个输入层
                buildInputWidget(context),
                //第六层 关闭按钮
                buildCloseWidget(context)
              ],
            ),
          )),
    );
  }

  Positioned buildInputWidget(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 20,
      left: 20,
      child: Column(
        children: [
          //手机号
          TextFieldWidget(
            hintText: "手机号",
            submit: (value) {
              if (value.length != 11) {
                ToastUtils.showToast("请输入11位手机号");
                //手机号输入框重新获取焦点
                FocusScope.of(context).requestFocus(_userNameFocusNode);
                return;
              }
              //手机号输入框失去焦点
              _userNameFocusNode.unfocus();
              //密码输入框获取焦点
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            focusNode: _userNameFocusNode,
            prefixIconData: Icons.phone,
            controller: _userNameEditController,
            obscureText: false,
          ),
          SizedBox(
            height: 20,
          ),
          //密码

          TextFieldWidget(
            hintText: "密码",
            submit: (value) {
              if (value.length < 6) {
                ToastUtils.showToast("请输入6位以上密码");
                //密码输入框获取焦点
                FocusScope.of(context).requestFocus(_passwordFocusNode);
                return;
              }
              //手机号输入框失去焦点
              _userNameFocusNode.unfocus();
              //密码输入框失去焦点
              _passwordFocusNode.unfocus();
              submitFunction();
            },
            focusNode: _passwordFocusNode,
            prefixIconData: Icons.lock_open_outlined,
            suffixIconData:
                _passwordShow ? Icons.visibility : Icons.visibility_off,
            obscureText: _passwordShow,
            controller: _userPasswordEditController,
            onTap: () {
              //设置密码输入框输入内容可见与不可见
              setState(() {
                _passwordShow = !_passwordShow;
              });
            },
          ),
          SizedBox(
            height: 40,
          ),

          //登录
          Container(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                LogUtils.e("点击了登录");
                submitFunction();
              },
              child: Text(
                "登录",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //注册
          Container(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                LogUtils.e("点击了注册");
              },
              child: Text(
                "注册",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///第六层 关闭按钮
  Positioned buildCloseWidget(BuildContext context) {
    return Positioned(
      left: 10,
      top: 24,
      child: CloseButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  ///第一层 背景
  Positioned buildBackgroundWidget() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          //线性渐变
          gradient: LinearGradient(
            //渐变的开始方向
            begin: Alignment.topLeft,
            //渐变的结束方向
            end: Alignment.bottomRight,
            //渐变的颜色组 最少为两个
            colors: [
              Colors.lightBlueAccent.withOpacity(0.3),
              Colors.blue.withOpacity(0.3),
            ],
          ),
        ),
      ),
    );
  }

  ///高斯模糊
  Positioned buildFliterWidget() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 0.3, sigmaX: 0.3),
        child: Container(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }

  //第三层 logo
  Positioned buildLogoWidget() {
    return Positioned(
      top: 120,
      left: 0,
      right: 0,
      child: Row(
        //子Widget水平居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "logo",
            child: Material(
              color: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/app_icon.png",
                  width: 33,
                  height: 33,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '欢迎登录',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey),
          )
        ],
      ),
    );
  }

  //登录功能
  void submitFunction() async {
    //获取用户名
    String userName = _userNameEditController.text;
    //获取密码
    String password = _userPasswordEditController.text;

    if (userName.trim().length != 11) {
      ToastUtils.showToast("请输入11位手机号");
      return;
    }
    if (password.trim().length < 6) {
      ToastUtils.showToast("请输入6位以上密码");
      return;
    }

    Map<String, dynamic> map = {
      "mobile": userName,
      "password": password,
    };

    //网络请求 发起 post 请求
    // ResponseInfo responseInfo = await DioUtils.instance.postRequest(
    //   //请求地址
    //   url: HttpHelper.login,
    //   //请求参数
    //   formDataMap: map,
    // );
    //模拟登录成功
    ResponseInfo responseInfo = await Future.delayed(Duration(milliseconds: 1000),(){
      return ResponseInfo(data: {
        "userName":"测试数据",
        "age":22,
      });
    });
    //响应成功
    if (responseInfo.success) {
      //解析数据
      UserBean userBean = UserBean.fromMap(responseInfo.data);
      //内存保存数据
      UserHepler.getInstance.userBean = userBean;
      //提示框
      ToastUtils.showToast("登录成功");
      //关闭当前页面
      Navigator.of(context).pop(true);
      //发送消息更新我的页面显示内容
      loginStreamController.add(0);
    } else {
      //登录失败页面小提示
      ToastUtils.showToast("${responseInfo.message}");
    }
  }
}
