//管理路由
import 'package:flutter/material.dart';
import 'package:myproject/pages/Main/index.dart';
import 'package:myproject/pages/Login/index.dart';



Widget getRootWidget() {
  return MaterialApp(
    //命名路由
    initialRoute: '/home',
    routes: getRoutes(),
  );
}
// 路由表
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    '/home': (context) => MainPage(),  //首页
    '/login': (context) => LoginPage(),//登录页
  };
}