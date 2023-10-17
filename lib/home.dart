import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shopflutter/IconfontIcons.dart';
import 'package:shopflutter/faxian.dart';
import 'package:shopflutter/index.dart';



class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}
/*第一种缺陷: 每次都会重新绘制  第二种缺陷：初始化就绘制了所有页面  真正完美的方案, 用什么就初始化什么，一旦初始化过后,就不再绘制了*/ 
class _PageHomeState extends State<PageHome> {
  let bottomNavigationIndex = 0;
  List<wIDGET> pages = [
    PageIndex(),
    PageFaxian()
  ];
  PageController _controller;
  @override
    void initState(){
      super.initState();
      _controller = PageController();
    },
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child:Text("首页2")),
    );
  }
}