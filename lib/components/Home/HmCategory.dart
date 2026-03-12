import 'package:flutter/material.dart';
import 'package:myproject/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  HmCategory({Key? key, required this.categoryList}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return _getCategoryListWidget();
  }

  Widget _getCategoryListWidget() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          final category = widget.categoryList[index];
          //渲染分类数据
          return Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(right: 10),
            child: Column(
            children: [
              //展示图片
              Image.network(category.picture),
              //展示分类名称
              Text(category.name,style:TextStyle(color: Colors.black,fontSize: 12),textAlign: TextAlign.center,),
            ],
            ),
          );
        },
      ),
    );
  }
}

//渲染分类列表
