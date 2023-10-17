import 'dart:convert'; // 解析utf-8
import 'dart:io';
import 'dart:async'; // 异步
import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'pages/PageDetail.dart';
void main() {
  runApp(const MyApp());
}
// flutter pub add dio  或者    dio: ^3.0.1  flutter run  flutter run --no-sound-null-safety flutter pub get
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
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

class _MyHomePageState extends State<MyHomePage> {
  List listData = [];
  requestConatcts() async{
    // https://randomuser.me/api/?results=20
    // var httpClient = new HttpClient();
    // var request =  await httpClient.getUrl(Uri.parse("https://randomuser.me/api/?results=20"));
    // var response = await request.close();
    // var responseBody = await response.transform(utf8.decoder).join();
    // var data = jsonDecode(responseBody);
    // print(data);
    // setState((){
    //   listData = data['results'];
    // });
    var dio = Dio();
    var response = await dio.get('https://randomuser.me/api/?results=20');
    print(response);
    setState((){
      listData = response.data['results'];
      listData.sort((left,right)=>left['name']['first'].compareTo(right['name']['first']));
    });
  }

  @override
  void initState(){
    requestConatcts();
    super.initState();
  }

  Widget getSingleCell(int index){
    // return Container( height: 80, child: Padding( padding:EdgeInsets.symmetric(horizontal:20), child: Row( children:[ Container(width:70,height:70,color:Colors.grey,), Expanded( child:Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text("姓名"), Text("电话") ], ) ), Icon(Icons.arrow_right) ], ) ) );
    Map item = listData[index];
    return ListTile(
        onTap: (){ // _ 占位符
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return PageDetail(detail: item);  
          }));
        },
        // Container border-radius:25; ClipRRect clipOval
        // leading: ClipRRect(
        //   borderRadius:BorderRadius.only(topLeft:Radius.circular(25)),
        //   child: Image.network(item['picture']['medium'],width:50,height:50),//large
        // ),
       leading: ClipOval(
        child: Image.network(item['picture']['medium'],width:80,height:50,fit:BoxFit.cover),//large
      ),
      title: Text(item['name']['first']+' '+item['name']['last']),
      subtitle: Text(item['name']['title']),
      trailing: Icon(Icons.arrow_right),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:Text("联系人"),
        ),
        body: Container( // Center
          width: double.infinity,
          height: double.infinity,
          // Row和Column的主轴和交叉轴互为相反  换行我们需要用Wrap  滑动需要使用ListView
          // ListView 的 三种构建方式   1. 直接给hildren 2. builder 3. Separated builder 
          child: ListView.separated(//ListView.builder
            separatorBuilder:(BuildContext context, int index){
              return Container(height:1, color: Colors.grey[300]);
            },
            // itemCount: 10,
            itemCount: listData.length,
            itemBuilder:(BuildContext context, int index){
            // print('item $index'); // 计算页面滚动最大量 一部分缓存 性能优化最好
            // return Text('item $index');
            return getSingleCell(index);
          })
        )
      );
  }
}
