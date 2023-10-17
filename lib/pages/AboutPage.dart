import 'package:flutter/material.dart';
import 'package:flutter_news/constants/Constants.dart';

class AboutPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Strings.AboutTiel)),
        body: Center(
          child: Column(
            children: <Widget>[
              FlutterLogo(size: 55.0),
              Container(
                padding: EdgeInsets.all(5.0),
              ),
              Text('作者: ${Strings.author}', style:TextStyle(fontSize:18.0,fontWeight:FontWeight.bold))
            ],
          ),
        ));
  }
}
