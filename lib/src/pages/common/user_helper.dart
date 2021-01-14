

import 'package:flutter_hzz_hoapp/src/bean/bean_user.dart';
import 'package:flutter_hzz_hoapp/src/pages/utils/sp_utils.dart';

class UserHepler {
  //私有化构造函数
  UserHepler._() {}

  //创建全局单例对象
  static UserHepler getInstance = UserHepler._();

  UserBean _userBean;

  //是否登录
  bool get isLogin => _userBean != null;

  set userBean(UserBean bean) {
    _userBean = bean;
    SPUtil.saveObject("user_bean", _userBean);
  }

  get userBean=>_userBean;


  void init(){
    Map<String, dynamic> map = SPUtil.getObject("user_bean");
    if(map!=null){
      //加载缓存
      _userBean= UserBean.fromMap(map);

    }
  }

  void clear(){
    _userBean = null;
    SPUtil.remove("user_bean");
  }

}
