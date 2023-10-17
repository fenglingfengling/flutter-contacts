import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
/*
flutter create xxx  解决版本问题 
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
/*
step1 在放按钮之前，我们需要⼀个承载按钮的布局容器
step2 我们要在这个容器⾥放⼀个按钮，按钮上⽂字显示”点我呀“
总之看完所有布局组件的⽂档，我们知道要⽤到这个组合
Stack，可以随意堆放⼦元素的布局
Positioned，绝对定位组件，改变top，left参数就可以跑来跑去啦
2 The method 'RaisedButton' isn't defined use ElevatedButton instead of RaisedButton
*/ 
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
  //获得当前设备屏幕尺⼨，需要import 'dart:ui'
  var s = window.physicalSize/window.devicePixelRatio;
  // var s = MediaQuery.of(context).size;
  //3 window弃用 改MediaQuery.of(context).size 
   print(s);
  //新建⼀个随机对象，import 'dart:math';
  var rng = new Random();
  //随机⽣成按钮的坐标
  double btnTop = rng.nextDouble()*(s.height-40);
  double btnLeft = rng.nextDouble()*(s.width-100);
    return Scaffold(
        body: Container( // Center
          color: Colors.blue,
          child:Stack(// SizedBox 2 Container
           children:[
            Positioned(
              left: btnLeft,
              top: btnTop,
              width: 100,//这是很多人喜欢Dart的原因,这个叫做命名参数  
              height:40,
              child: ElevatedButton(//ElevatedButton
                onPressed: (){
                  setState((){});//关键是这⼀句
                },
                child:Text('点我呀',style:TextStyle(color:Colors.white)),
              )
            )
           ]
          ),
        )
      );
  }
}
