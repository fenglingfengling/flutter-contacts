import 'package:flutter/material.dart';
import 'dart:convert';
import "aboutpage.dart";
import 'package:flutter_news/models/local/Channel.dart';
import 'package:flutter_news/constants/Constants.dart';
import 'package:flutter_news/widgets/NewsListWidget.dart';


class HomePage extends StatefulWidget {
  // 通过显示声明key的方式 提高渲染性能
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

/*
1 The argument type 'Widget' can't be assigned to the parameter type 'PreferredSizeWidget?  Widget替换PreferredSizeWidget
lib/pages/HomePage.dart:16:17: Error: Field '_tabController' should be initialized because its type 'TabController' doesn't allow null.
TabController ?_tabController;   D:\flutter\packages\flutter\lib\src\material\tab_controller.dart
SingleTickerProviderStateMixin 这样的声明 引入List
*/ 
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  //  Tab点击
  TabController _tabController;
  // Tab数据
  List<Channel> channels;

  @override
  initState() {
    super.initState();
    _initChannelData();
  }

  // 渲染头部Tab组件
  Widget _initChannelTitle() {
    return TabBar(
        controller: _tabController,
        indicatorColor: Colors.blue[100],
        tabs: channels.map((Channel channel) {
          return Tab(text: channel.channelName);
        }).toList());
  }

  // 初始化Tab数据
  _initChannelData() {
    print("--- tab数据初始化 ---");
    channels = List<Channel>();
    // 从远程接口请求
    Future<String> data =
        DefaultAssetBundle.of(context).loadString("assets/config/channel.json");
    data.then((String value) {
      setState(() {
        List<dynamic> data = json.decode(value);
        _tabController = TabController(vsync: this, length: data.length);
        data.forEach((tmp) {
          channels.add(Channel.fromJson(tmp));
        });
      });
    });
  }

  // 初始化列表内容 迭代器的数组转变成真实的数组 toList()
  Widget _initChannelList() {
    return TabBarView(
        controller: _tabController,
        children: channels.map((Channel channel) {
          return NewsListWidget(channel: channel);
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: channels.length,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.title),
          bottom: _initChannelTitle(),
          title: Text(Strings.appTitle, style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.assessment),
              onPressed: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              }),
            ),
          ],
        ),
        body: _initChannelList(),
      ),
    );
  }

  bool get wantKeepAlive => true;
}
