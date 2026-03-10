import 'package:flutter/material.dart';

class HmHot extends StatefulWidget {
  HmHot({Key? key}) : super(key: key);

  @override
  _HmHotState createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
       alignment: Alignment.center,
       color: Colors.blue,
       height: 150,
       child:Text('热门爆款',style: TextStyle(fontSize: 16,color: Colors.white),),
    );
  }
}