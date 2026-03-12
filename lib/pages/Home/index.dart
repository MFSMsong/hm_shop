import 'package:flutter/material.dart';
import 'package:myproject/api/home.dart';
import 'package:myproject/components/Home/HmCategory.dart';
import 'package:myproject/components/Home/HmHot.dart';
import 'package:myproject/components/Home/HmMoreList.dart';
import 'package:myproject/components/Home/HmSlider.dart';
import 'package:myproject/components/Home/HmSuggestion.dart';
import 'package:myproject/utils/DioRequest.dart';
import 'package:myproject/utils/ToastUtils.dart';
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

    // 推荐列表
  List<GoodDetailItem> _recommendList = [];


  //监听滚动事件
  final ScrollController _scrollController = ScrollController();
  
  

  @override
  initState(){
    super.initState();
    // //调用API获取轮播图数据
    // _getBannerList();
    // //调用API获取分类数据
    // _getCategoryList();
    // //调用API获取特惠推荐数据
    // _getSpecialRecommendationResult();    
    // //调用API获取热榜推荐数据
    // _getInVogueList();
    // //调用API获取一站式推荐数据
    // _getOneStopList();
    // //调用API获取推荐列表数据
    // _getRecommendList();
    //注册滚动事件监听
    _registerController();
    Future.microtask(() {
      _refreshIndicatorKey.currentState?.show();
    });
  }

  // 获取轮播图列表
  Future<void> _getBannerList() async{
    //调用API获取轮播图数据
    try {
      _bannerList = await getBannerListApi();
      print('轮播图数据获取成功: ${_bannerList.length} 条');
      print(_bannerList[0].imageUrl);
    } catch (e) {
      print('轮播图数据获取失败: $e');
    }
  }

  // 获取分类列表
  Future<void> _getCategoryList() async{
    //调用API获取分类数据
    try {
      _categoryList = await getCategoryListApi();
      print('分类数据获取成功: ${_categoryList.length} 条');
    } catch (e) {
      print('分类数据获取失败: $e');
    }
  }

  // 获取特惠推荐列表
  Future<void> _getSpecialRecommendationResult() async{
    //调用API获取特惠推荐数据
    try {
      _specialRecommendationResult = await getSpecialRecommendationApi();
      print('特惠推荐数据获取成功: ${_specialRecommendationResult?.subTypes.length} 条');
    } catch (e) {
      print('特惠推荐数据获取失败: $e');
    }
  }

  // 获取热榜推荐列表
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
  }

  // 获取一站式推荐列表
  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
  }

  //页码
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  // 获取推荐列表
  Future<void> _getRecommendList() async {
    //如果正在请求或者没有更多数据了，就直接返回
    if(_isLoading || !_hasMore) return;



    _isLoading = true;
    int requestlimit = _page * 10;
    _recommendList = await getRecommendListAPI({"limit": requestlimit});
     _isLoading = false;
     setState(() {});
    //如果返回的列表为空，说明没有更多数据了
    if(_recommendList.length < requestlimit){
      _hasMore = false;
      return ;
    }
    _page++;
  }

  Future<void> _refresh() async {
    // 下拉刷新时，重置页码和更多数据标志
    _page = 1;
    _hasMore = true;
    _isLoading = false;
    // 调用获取推荐列表的方法
    await _getRecommendList();
    //调用API获取轮播图数据
    await _getBannerList();
    //调用API获取分类数据
    await _getCategoryList();
    //调用API获取特惠推荐数据
    await _getSpecialRecommendationResult();    
    //调用API获取热榜推荐数据
    await _getInVogueList();
    //调用API获取一站式推荐数据
    await _getOneStopList();
    // 显示刷新成功的提示
    ToastUtils.showToast(context, "刷新成功");
    setState(() {});
  }

//GlobalKey绑定组件后，就可以调用组件的方法了
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: CustomScrollView(
      controller: _scrollController,
      slivers: _buildSlivers()
      ),
    );
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
      HmMoreList(recommendList: _recommendList),
    ];
  }
  
  void _registerController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= (_scrollController.position.maxScrollExtent - 50)) {
        // 加载更多的推荐数据
        print("加载更多的推荐数据");
        _getRecommendList();
      }
    });
  }
  
  
}
