import 'dart:convert';
import 'dart:io';
import 'dart:async'; // 异步
// import 'dart:ui';
// Flutter Widgets Catalog git clone https://github.com/ezshine/FlutterWidgetsCatalog.git 爬虫命令 node getWidgetsCatalog.js
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'pages/HomePage.dart';
// import 'pages/Search.dart';
// import 'package:http/http.dart' as http;
// import 'index2.dart';
/*
flutter create xxx  解决版本问题 可以看每个函数英文翻译知道意思
flutter 常用命令 相关项目操作 查看 Flutter 版本 查看当前版本 flutter  --version 查看所有版本 flutter version 打印所有命令行用法信息 flutter  -h或者flutter  --help 分析项目的 Dart 代码。 flutter  analyze Flutter 构建命令。 flutter  build 列表或开关 Flutter 通道。 flutter channel 删除构建 / 目录。 flutter  clean 配置 Flutter 设置。 flutter config 创建一个新的 Flutter 项目。 flutter  create 列出所有连接的设备。 flutter  devices 展示了有关安装工具的信息。 flutter doctor 为当前项目运行 Flutter 驱动程序测试。 flutter drive 格式一个或多个 Dart 文件。 flutter format 在 Fuchsia 上进行热重载。 flutter  fuchsia_reload 显示帮助信息的 Flutter。 flutter help 在附加设备上安装 Flutter 应用程序。 flutter install 显示用于运行 Flutter 应用程序的日志输出。 flutter logs 命令用于管理 Flutter 包。 flutter packages 填充了 Flutter 工具的二进制工件缓存。 flutter  precache 在附加设备上运行你的 Flutter 应用程序。 flutter  run 从一个连接的设备截图。 flutter screenshot 停止在附加设备上的 Flutter 应用。 flutter stop 对当前项目的 Flutter 单元测试。 flutter test 开始并停止跟踪运行的 Flutter 应用程序。 flutter trace 升级你的 Flutter 副本。 flutter upgrade
查看⽂档的基本概念 ⼀切皆是Widgets 多组件容器（Row、Column、Stack、Wrap） 单组件容器（Container、Padding、Center、Align） Futter 组件的规律
学习第一个问题是 如何调数据  最重要才能后面开发 
*/

void main() {
  runApp(const MyApp());
}

/*
stateful:当创建⼀⼀个能随时间动态改变的widget，并且不不依赖于其初始化状态。eg:Image
注意: 无状态组件
 1 创建⼀个Stateful Widget需要两个类，分别继承⾃StateFulWidget和State; 2 state对象包含了widget的state和widget的build()⽅法; 3 当widget的state改变了的时候，当调⽤setState()⽅法时，框架就会去调⽤build⽅法重绘 widget;
Key? key,required this.text 声明可选参数可空 ? required 引入值
 lib/main.dart:19:36: Error: The parameter 'text' can't have a value of 'null' because of its type 'String', but the implicit default value is 'null'.
Try adding either an explicit non-'null' default value or the 'required' modifier.
  MyStatelessWidget({Key key, this.text}) : super(key: key);
  打印⽇志 print();
*/
// void main() => runApp(MyStatelessWidget(text: "StatelessWidget Example"));
// class MyStatelessWidget extends StatelessWidget {
//   final String text;
//   MyStatelessWidget({Key? key,required this.text}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         text,
//         textDirection: TextDirection.ltr,
//       ),
//     );
//   }
// }
// 点不到的按钮
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '联系人',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// State类比onLoad initState() 生命周期
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  // TabController _tabController = TabController(length: tabTexts.length,vsync:this),
  List<String> tabTexts = [
    '推荐',
    '热榜',
    '前端',
    '后端',
    'Android',
    'IOS',
    '人工智能',
    '开发工具',
    '代码人生',
    '阅读'
  ];
  //6 '_tabController' should be initialized because its type 'TabController' doesn't allow null. abController? _tabController;
  TabController? _tabController;

  getTabs() {
    List<Tab> results = [];
    for (int i = 0; i < tabTexts.length; i++) {
      results.add(Tab(text: tabTexts[i]));
    }
    return results;
  }
  /*
  7 HttpClient来自 import 'dart:io库'; 和 http库请求数据
  8 添加库 pubspec.yaml dependencies: http: ^0.12.2 然后自动下载 再去引入就行
  9 问题下载包的时候失败 OUTPUT输出是另一个项目名字 直接吧当前的上传上去 flutter pub get
  10 Error: Cannot run with sound null safety, because the following dependencies don't support null safety: 
  run flutter run --no-sound-null-safety build flutter build apk --no-sound-null-safety
  */
  getArticlesData() async{
    var url = "https://apinew.juejin.im/recommend_api/v1/article/recommend_all_feed";
    // var httpClient = new HttpClient();
    // var request = await httpClient.postUrl(Uri.parse(url));
    Map postData={
      "client_type":"2608",
      "cursor":"0",
      "id_type":"2",
      "limit": "20"
    };
    // request.add(utf8.encode(json.encode(postData)));
    // var response = await request.close();
    // var responseBody = await response.transform(utf8.decoder).join("");
    // var listData = jsonDecode(responseBody);
    // print(listData);
    // print(listData["data"]);
    var response = await http.post(url,body:postData);
    print(response.body);

  }
  getTabBarViews() {
    List<Widget> results = [];
    for (int i = 0; i < tabTexts.length; i++) {
      // results.add(Center(child: Text(tabTexts[i])));
      if(i==0){
        // results.add(ListView( children:[ ElevatedButton(child:Text("按钮"),onPressed:(){}), Image.asset("assets/images/paris.jpg",width:100,height:50), Text("列表页"), Container( height:60, child: ListView( scrollDirection: Axis.horizontal, children:[ ElevatedButton(child:Text("1"),onPressed:(){}), ElevatedButton(child:Text("2"),onPressed:(){}), ElevatedButton(child:Text("3"),onPressed:(){}), ElevatedButton(child:Text("4"),onPressed:(){}), ElevatedButton(child:Text("5"),onPressed:(){}), ElevatedButton(child:Text("6"),onPressed:(){}), ElevatedButton(child:Text("7"),onPressed:(){}), ElevatedButton(child:Text("8"),onPressed:(){}), ] ) ) ], ));
        // 运用复用机制 常用于长链表 嵌套是常规
        results.add(
          ListView.builder(
            itemCount:100,
            itemBuilder: (context,index){
              if(index==0){
                return Container(
                  height:40,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount:100,
                    itemBuilder:(context,rindex){
                      return Text("$rindex");
                    }
                  )
                );
              }else{
                return Text("$index");
              }
            }
          )
        );
      }else{
        results.add(
          Center(
            child:Text(tabTexts[i])
          )
        );
      }
    }
    return results;
  }
  @override
  void initState(){
    super.initState();
    _tabController = new TabController(length:tabTexts.length,vsync:this);
  }
  @override
    void dispose(){
      super.dispose();
      getArticlesData();
      _tabController?.dispose();
    }
  @override
  Widget build(BuildContext context) {
    // 圆形或圆⻆图⽚的显示 Container( decoration: ShapeDecoration(image:DecorationImage())) ClipRRect() dart --version dart版本
    // 4 Flutter 中FlatButton的替代方案 field named 'FlatButton'.使用 TextButton 或 ElevatedButton 来进行替代
    /*Row & Column Row 组件是不可以滚动的，所以在 Row 组件中⼀般不会放置过多 ⼦组件，如果需要滚动的话应该考虑使⽤ ListView。 如果需要垂直展示，应该考虑 Column 组件。*/
    // ListView 构建ListView的三种⽅式 ListView() 使⽤场景：少量数据 ListView.build() 使⽤ ListView.separated ⾃带分割线
    return Scaffold(
      appBar: AppBar(
          // title: Text(widget.title),
          // ElevatedButton(child: Text("按钮"), onPressed: () {}),
          title: Row(
            children: [
              Expanded(
                  // child: Container( color: Color.fromRGBO(238, 242, 245, 1), child: Text('搜索', style: TextStyle(fontSize: 12, color: Colors.grey)))
                  child: ElevatedButton(onPressed: () {}, child: Text("搜索"))),
              ElevatedButton.icon(
                  icon: Icon(Icons.settings),
                  label: Text("标签"),
                  onPressed: () {})
            ],
          ),
          // tabs:getTabs()
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: getTabs(),
          )
          // Row(children: [
          //   Expanded(child:Container(color: Color.fromRGBO(238, 242, 245, 1), child: Text("搜索",style: TextStyle(fontSize:12,color:Colors.grey)))),
          //   FlatButton.icon(
          //       icon: Icon(Icons.settings),
          //       label: Text("标签"),
          //       onPressed: () {}))])
          // leading: ElevatedButton(child:Text("左侧"),onPressed:(){}),
          // actions: [
          //   ElevatedButton(child:Text("右"),onPressed:(){}),
          //   ElevatedButton(child:Text("侧"),onPressed:(){})
          // ],
          ),
      // drawer: Container(
      //   width: 200,
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment(-1, 0),
      //       end: Alignment(1.0, 0),
      //       colors: <Color>[
      //         const Color(0xFF9A9E5000),
      //         const Color(0xFAD0C4000),
      //       ],
      //     ),
      //   ),
      //   child: Center(child: Text('侧边栏')),
      // ),
      // endDrawer: Container(
      //   width: 200,
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment(-1, 0),
      //       end: Alignment(1.0, 0),
      //       colors: <Color>[
      //         const Color(0xA18CD1000),
      //         const Color(0xFBC2EB000),
      //       ],
      //     ),
      //   ),
      //   child: Center(child: Text('侧边栏')),
      // ),
      // body: Center(
      //     //asset 获取assets文件资源 network 是在线网络图片 "https://www.baidu.com/s?wd=%E7%99%BE%E5%BA%A6%E7%83%AD%E6%90%9C&sa=ire_dl_gh_logo_texing&rsv_dl=igh_logo_pcs",
      //     // Image.asset( "assets/images/pairs.jpg", width: 100, height: 60 // , // fit: BoxFit.fill )),
      //     // Container( width: 100, height: 100, decoration: ShapeDecoration( image: DecorationImage( image: AssetImage("assets/images/paris.jpg")), shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(50))))
      //     child: ClipRRect(
      //   child: Image.asset("assets/images/paris.jpg", height: 200, width: 200),
      //   borderRadius: BorderRadius.circular(100),
      // )),
      // body: Container( color: Colors.pink, child: ClipOval( child: Image.network( "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"))),
      body: TabBarView(controller: _tabController, children: getTabBarViews()),
      floatingActionButton:
          ElevatedButton(child: Text("浮动按钮1"), onPressed: () {}),
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.shifting, items: [
        BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "发现", icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: "个人", icon: Icon(Icons.people))
      ]),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
