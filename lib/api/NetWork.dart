import 'package:flutter_news/constants/Constants.dart';
import 'package:http/http.dart' as http;
// 1 对涉猎请求做一个包装,逻辑的处理,数据的预处理. 定义网络请求库配置
class NetWork {
  static bool _debug = true;
  // 网易新闻host
  static String NETEAST_HOST = 'https://c.m.163.com';
  // 新浪图片的host
  static String SINA_PHOTO_HOST = 'http://api.sina.cn/sinago/';
  // 天气预报
  static String WEATHER_HOST = 'http://wthrcdn.etouch.cn/';

  static String getHost(int type) {
    switch (type) {
      case Constants.TYPE_NET_NETEASE_NEWS:
        return NETEAST_HOST;
      case Constants.TYPE_NET_SINA_NEWS:
        return SINA_PHOTO_HOST;
      case Constants.TYPE_NET_WEATHER_NEWS:
        return WEATHER_HOST;
      default:
        return '';
    }
  }

  // 包装get请求
  static Future<String> get(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = StringBuffer("?");
      params.forEach((key, value) => {sb.write("$key" + "=" + "$value" + "&")});
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }

    http.Response res = await http.get(url, headers: getCommonHeaders());
    if (_debug) {
      print('________________');
      print('|发起GET请求|');
      print('|请求URL：$url|');
      print('|返回数据:${res.body}|');
      print('_________________');
    }
    return res.body;
  }

  /*
  包装post请求 包装请求头,对接口是h5站点,请求Header进行伪造包装,模拟ua,不然我们请求头重定向到站点,模拟ua表示使用的ios;
  规范格式化输出日志,同事遇到异常阶段的时候不用判断处理,业务错误码提示,根据包装的提示全部包在我们的Network里面.业务开发组件化.规范化日志,开发更加流畅.
  */  

  static Future<String> post(String url, {Map<String, String> params}) async {
    http.Response res =
        await http.post(url, body: params, headers: getCommonHeaders());
    if (_debug) {
      print('________________');
      print('|发起GET请求|');
      print('|请求URL：$url|');
      print('|返回数据:${res.body}|');
      print('_________________');
    }
    return res.body;
  }

  static Map<String, String> getCommonHeaders() {
    Map<String, String> header = Map();
    header['User-Agent'] =
        'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36';
    return header;
  }
}
