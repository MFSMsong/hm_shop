import 'package:flutter/material.dart';
import 'package:myproject/components/Home/HmCategory.dart';
import 'package:myproject/components/Home/HmHot.dart';
import 'package:myproject/components/Home/HmMoreList.dart';
import 'package:myproject/components/Home/HmSlider.dart';
import 'package:myproject/components/Home/HmSuggestion.dart';
import 'package:myproject/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [
    BannerItem(
      id: '1',
      imageUrl:'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg',
    ),
    BannerItem(
      id: '2',
      imageUrl:'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png',
    ),
    BannerItem(
      id: '3',
      imageUrl:'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _buildSlivers());
  }

  List<Widget> _buildSlivers() {
    return [
      //轮播图组件
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //分类组件
      SliverToBoxAdapter(child: HmCategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //推荐组件
      SliverToBoxAdapter(child: HmSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //热门爆款组件
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //更多列表组件
      HmMoreList(),
    ];
  }
}
