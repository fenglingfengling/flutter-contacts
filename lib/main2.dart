import 'package:flutter/material.dart';
import 'dart:ui';

/*
flutter create xxx  解决版本问题 
flutter 常用命令 相关项目操作 查看 Flutter 版本 查看当前版本 flutter  --version 查看所有版本 flutter version 打印所有命令行用法信息 flutter  -h或者flutter  --help 分析项目的 Dart 代码。 flutter  analyze Flutter 构建命令。 flutter  build 列表或开关 Flutter 通道。 flutter channel 删除构建 / 目录。 flutter  clean 配置 Flutter 设置。 flutter config 创建一个新的 Flutter 项目。 flutter  create 列出所有连接的设备。 flutter  devices 展示了有关安装工具的信息。 flutter doctor 为当前项目运行 Flutter 驱动程序测试。 flutter drive 格式一个或多个 Dart 文件。 flutter format 在 Fuchsia 上进行热重载。 flutter  fuchsia_reload 显示帮助信息的 Flutter。 flutter help 在附加设备上安装 Flutter 应用程序。 flutter install 显示用于运行 Flutter 应用程序的日志输出。 flutter logs 命令用于管理 Flutter 包。 flutter packages 填充了 Flutter 工具的二进制工件缓存。 flutter  precache 在附加设备上运行你的 Flutter 应用程序。 flutter  run 从一个连接的设备截图。 flutter screenshot 停止在附加设备上的 Flutter 应用。 flutter stop 对当前项目的 Flutter 单元测试。 flutter test 开始并停止跟踪运行的 Flutter 应用程序。 flutter trace 升级你的 Flutter 副本。 flutter upgrade
查看⽂档的基本概念 ⼀切皆是Widgets 多组件容器（Row、Column、Stack、Wrap） 单组件容器（Container、Padding、Center、Align） Futter 组件的规律
学习第一个问题是 如何调数据  最重要才能后面开发 
10  最大问题就是有的跑不起来删了 或者 把插件版本改了 ctrl+save保存一下
随机数接口 https://randomuser.me/api/?results=10
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // 圆形或圆⻆图⽚的显示 Container( decoration: ShapeDecoration(image:DecorationImage())) ClipRRect() dart --version dart版本
    // 4 Flutter 中FlatButton的替代方案 field named 'FlatButton'.使用 TextButton 或 ElevatedButton 来进行替代
    /*Row & Column Row 组件是不可以滚动的，所以在 Row 组件中⼀般不会放置过多 ⼦组件，如果需要滚动的话应该考虑使⽤ ListView。 如果需要垂直展示，应该考虑 Column 组件。*/
    // ListView 构建ListView的三种⽅式 ListView() 使⽤场景：少量数据 ListView.build() 使⽤ ListView.separated ⾃带分割线
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text(widget.title),
          // ElevatedButton(child: Text("按钮"), onPressed: () {}),
          title: Row(children: [
        Expanded(
            // child: Container( color: Color.fromRGBO(238, 242, 245, 1), child: Text('搜索', style: TextStyle(fontSize: 12, color: Colors.grey)))
            child: ElevatedButton(onPressed: () {}, child: Text("搜索"))),
        TextButton.icon(
            icon: Icon(Icons.settings), label: Text("标签"), onPressed: () {})
      ])
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
      drawer: Container(
        width: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, 0),
            end: Alignment(1.0, 0),
            colors: <Color>[
              const Color(0xFF9A9E5000),
              const Color(0xFAD0C4000),
            ],
          ),
        ),
        child: Center(child: Text('侧边栏')),
      ),
      endDrawer: Container(
        width: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, 0),
            end: Alignment(1.0, 0),
            colors: <Color>[
              const Color(0xA18CD1000),
              const Color(0xFBC2EB000),
            ],
          ),
        ),
        child: Center(child: Text('侧边栏')),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          // child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     const Text(
          //       'You have pushed the button this many times:',
          //     ),
          //     Text(
          //       '$_counter',
          //       style: Theme.of(context).textTheme.headline4,
          //     ),
          //   ],
          // ),
          //asset 获取assets文件资源 network 是在线网络图片 "https://www.baidu.com/s?wd=%E7%99%BE%E5%BA%A6%E7%83%AD%E6%90%9C&sa=ire_dl_gh_logo_texing&rsv_dl=igh_logo_pcs",
          //asset 获取assets文件资源 network 是在线网络图片 "https://www.baidu.com/s?wd=%E7%99%BE%E5%BA%A6%E7%83%AD%E6%90%9C&sa=ire_dl_gh_logo_texing&rsv_dl=igh_logo_pcs",
          // Image.asset( "assets/images/pairs.jpg", width: 100, height: 60 // , // fit: BoxFit.fill )),
          // Container( width: 100, height: 100, decoration: ShapeDecoration( image: DecorationImage( image: AssetImage("assets/images/paris.jpg")), shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(50))))
          child: ClipRRect(
        child: Image.asset("assets/images/paris.jpg", height: 200, width: 200),
        borderRadius: BorderRadius.circular(100),
      )),
      // body: Container( color: Colors.pink, child: ClipOval( child: Image.network( "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"))),
      floatingActionButton:
          ElevatedButton(child: Text("浮动按钮1"), onPressed: () {}),
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.shifting, items: [
        BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "发现", icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: "个人", icon: Icon(Icons.people))
      ]),
    );
  }
}
