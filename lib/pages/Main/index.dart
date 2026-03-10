import 'package:flutter/material.dart';
import 'package:myproject/pages/Cart/index.dart';
import 'package:myproject/pages/Category/index.dart';
import 'package:myproject/pages/Home/index.dart';
import 'package:myproject/pages/Mine/Mine.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  //定义导航索引
  //定义当前选中的索引
  int _currentIndex = 0;
  //一般导航栏是不可更改的
  final List <Map<String, dynamic>> _tabList = [
    {
      'icon':'lib/assets/ic_public_cart_normal.png',
      'active_icon':'lib/assets/ic_public_cart_active.png',
      'label': '首页',
    },
    {
      'icon':'lib/assets/ic_public_pro_normal.png',
      'active_icon':'lib/assets/ic_public_pro_active.png',
      'label': '分类',
    },
    {
      'icon':'lib/assets/ic_public_cart_normal.png',
      'active_icon':'lib/assets/ic_public_cart_active.png',
      'label': '购物车',
    },
    {
      'icon':'lib/assets/ic_public_my_normal.png',
      'active_icon':'lib/assets/ic_public_my_active.png',
      'label': '我的',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getBodyChildren(),
        ),
      ),
      bottomNavigationBar: (
        BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          
          _currentIndex = index;
          setState(() {});
        },
          currentIndex: _currentIndex,
          items: _getBottomNavigationBarItems(),
        )
      ),
    );
  }
  
  List<BottomNavigationBarItem> _getBottomNavigationBarItems() {
    return List.generate(_tabList.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]['icon'],
        width: 24,
        height: 24,
        ),
        activeIcon: Image.asset(_tabList[index]['active_icon'],
        width: 24,
        height: 24,
        ),
        label: _tabList[index]['label'],
      );
    });
  }

  List<Widget> _getBodyChildren() {
    return [
      HomeView(),
      CategoryView(),
      CartView(),
      MineView(),
    ];
  }
}