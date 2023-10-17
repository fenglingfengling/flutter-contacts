import 'package:event_bus/event_bus.dart';

class Constants{
  // 主题配色
  // 接口
  // 网易新闻
  static const int TYPE_NET_NETEASE_NEWS = 1;
  // 新浪新闻
  static const int TYPE_NET_SINA_NEWS = 2;
  // 天气  
  static const int TYPE_NET_WEATHER_NEWS=3;
  // 全局的event_bus
  static final EventBus eventBus = new EventBus();
}
class Strings{
  // 关于应用标题 
  static final String AboutTiel = "关于我";
  //应用首页标题 
  static final String appTitle = "新闻应用";
  //开发者
  static final String author = "WoodSunning";
}