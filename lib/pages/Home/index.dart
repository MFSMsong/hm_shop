import 'package:flutter/material.dart';
import 'package:myproject/api/home.dart';
import 'package:myproject/components/Home/HmCategory.dart';
import 'package:myproject/components/Home/HmHot.dart';
import 'package:myproject/components/Home/HmMoreList.dart';
import 'package:myproject/components/Home/HmSlider.dart';
import 'package:myproject/components/Home/HmSuggestion.dart';
import 'package:myproject/utils/DioRequest.dart';
import 'package:myproject/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
  SpecialRecommendationResult _specialRecommendationResult = SpecialRecommendationResult(
    id: "", 
    title: "", 
    subTypes: []
    );
    // 热榜推荐
    SpecialRecommendationResult _inVogueResult = SpecialRecommendationResult(
      id: "",
      title: "",
      subTypes: [],
    );
    // 一站式推荐
    SpecialRecommendationResult _oneStopResult = SpecialRecommendationResult(
      id: "",
      title: "",
      subTypes: [],
    );
  

  @override
  initState(){
    super.initState();
    //调用API获取轮播图数据
    _getBannerList();
    //调用API获取分类数据
    _getCategoryList();
    //调用API获取特惠推荐数据
    _getSpecialRecommendationResult();    
    //调用API获取热榜推荐数据
    _getInVogueList();
    //调用API获取一站式推荐数据
    _getOneStopList();
  }

  void _getBannerList() async{
    //调用API获取轮播图数据
    try {
      _bannerList = await getBannerListApi();
      print('轮播图数据获取成功: ${_bannerList.length} 条');
      print(_bannerList[0].imageUrl);
      setState(() {});
    } catch (e) {
      print('轮播图数据获取失败: $e');
    }
  }

  void _getCategoryList() async{
    //调用API获取分类数据
    try {
      _categoryList = await getCategoryListApi();
      print('分类数据获取成功: ${_categoryList.length} 条');
      setState(() {});
    } catch (e) {
      print('分类数据获取失败: $e');
    }
  }

  void _getSpecialRecommendationResult() async{
    //调用API获取特惠推荐数据
    try {
      _specialRecommendationResult = await getSpecialRecommendationApi();
      print('特惠推荐数据获取成功: ${_specialRecommendationResult?.subTypes.length} 条');
      setState(() {});
    } catch (e) {
      print('特惠推荐数据获取失败: $e');
    }
  }

  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

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
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //推荐组件
      SliverToBoxAdapter(child: HmSuggestion(specialRecommendationResult: _specialRecommendationResult)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),

      //热门爆款组件
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
                Expanded(
                child: HmHot(result: _inVogueResult, type: "hot"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: HmHot(result: _oneStopResult, type: "step"),
              ),

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
