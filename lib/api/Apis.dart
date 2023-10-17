import 'package:flutter_news/models/network/NesList.dart';

import 'NetWork.dart';
import 'dart:convert';
// 不同组件不通模块的通信 eventBus
import 'package:flutter_news/events/BeanEvent.dart';
import 'package:flutter_news/constants/Constants.dart';

/** 网易新闻网络请求 */
class API$NETease {
  // 请求新闻列表接口
  getNewsList(String type, String id, int startPage) {
    String url =
        NetWork.NETEAST_HOST + 'nc/article/$type/$id/$startPage-20.html';
    NetWork.get(url).then((data) {
      if (data != null) {
        Map<String, dynamic> map = json.decode(data);
        Constants.eventBus
            .fire(BeanEvent<NewsList>(id, NewsList.fromJson(id, map)));
        print(map);
      }
    });
  }

  // 获取新闻详情
  getNewsDetail(String postId) {
    String url = NetWork.NETEAST_HOST + 'nc/artic/$postId/full.html';
    NetWork.get(url).then((data) {
      if (data != null) {
        Map<String, dynamic> map = json.decode(data);
      }
    });
  }
}

/** 新浪新闻网络请求 */
class API$Sina {}

/** 天气信息网络请求 */
class API$Weather {}
