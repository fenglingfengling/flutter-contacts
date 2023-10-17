import 'package:flutter/material.dart';
import 'package:flutter_news/api/Apis.dart';
import 'package:flutter_news/constants/Constants.dart';
import 'package:flutter_news/models/network/NesList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_news/models/local/Channel.dart';
// 4 渲染列表的数据
class NewsListWidget extends StatefulWidget {
  final Channel channel;
  NewsListWidget({Key key, this.channel}) : super(key: key);

  _NewsListState createState() => _NewsListState();
}

/**
 * 1.处理分页和下拉加载
 * 2.处理和tab组件的通信，在tab改变的时候发起数据请求，更新list的数据内容
 */

class _NewsListState extends State<NewsListWidget> {
  Widget _renderRow(int position) {
    print(API$NETease);
    return Text("标题:");
  }

  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, i) => _renderRow(i),
        padding: EdgeInsets.all(10.0),
        itemCount: 5);
  }
}
