import 'package:flutter/cupertino.dart';

class NavigatorService {
  static final _singleton = NavigatorService._internal();
  NavigatorService._internal();

  static NavigatorService get instance => _singleton;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  void pop<T extends Object>([T? result]) {
    return _navigatorKey.currentState?.pop(result);
  }

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? popNavigateTo(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState?.popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? popAllNavigateTo(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  bool? canPop(){
    return _navigatorKey.currentState?.canPop();
  }
}