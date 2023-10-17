  import 'package:flutter/widgets.dart';
  import 'package:flutter/material.dart';
  class PageDetail extends StatefulWidget {
    Map detail;
    // Error: 'key' isn't a type. 小写了 Key
    PageDetail({
      Key? key,
      required this.detail
    }): super(key: key);

    @override
    _PageDetailState createState() => _PageDetailState();
  }

  class _PageDetailState extends State<PageDetail> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title:Text(widget.detail['name']['first'])),
        body: Container(
          width: double.infinity,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:BorderRadius.circular(50),
                child: Image.network(widget.detail['picture']['large']),
              ), // 
              Text(widget.detail['name']['title']),
              Text(widget.detail['email']),
              // Text(widget.detail['city']),
              // Text(widget.detail['country']) 报错原因是Text的内容不能为空值，检查Text的值 A non-null String must be provided to a Text widget.
            ],
          )
        )
      );
    }
  }