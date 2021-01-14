
import 'package:flutter_hzz_hoapp/src/bean/bean_user.dart';

class ArtBean {
  //文章标题
  String artTitle;
  //文章简介
  String artInfo;
  //喜欢个数
  int likeCount;
  //评论个数
  int pariseCount;
  //用户数据
  UserBean userBean;
  //创建时间
  String createTime;

  ///常用用于解析JSON数据
  ArtBean.fromMap(Map<String, dynamic> map) {
    this.artTitle = map["title"];
    this.artInfo = map["artInfo"];

    this.likeCount = map["readCount"];
    this.pariseCount = map["pariseCount"];
    this.createTime = map['createTime'];

    var bean = map["user"];
    if (bean != null) {
      userBean = UserBean.fromMap(bean);
    }
  }

}
