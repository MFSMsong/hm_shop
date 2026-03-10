import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  CategoryView({Key? key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('分类',style: TextStyle(fontSize: 16,color: Colors.white),),   
    );
  }
}