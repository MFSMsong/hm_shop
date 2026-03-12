import 'package:dio/dio.dart';
import 'package:myproject/contants/index.dart';
import 'package:myproject/utils/DioRequest.dart';
import 'package:myproject/viewmodels/home.dart';

//封装一个请求API，用于返回业务侧需要的数据结构
Future<List<BannerItem>> getBannerListApi() async{

  dynamic res = await dioRequest.get(HttpConstants.BANNER_URL);

  return (res as List).map(
    (item) => BannerItem.formJSON(item as Map<String,dynamic>)
    ).toList();
}

Future<List<CategoryItem>> getCategoryListApi() async{
  dynamic res = await dioRequest.get(HttpConstants.CATEGORY_URL);
  return (res as List).map(
    (item) => CategoryItem.formJSON(item as Map<String,dynamic>)
    ).toList();
}

Future<SpecialRecommendationResult> getSpecialRecommendationApi() async{
  dynamic res = await dioRequest.get(HttpConstants.SUGGESTION_PRODUCT_URL);
  return SpecialRecommendationResult.formJson(res as Map<String,dynamic>);
}

// 热榜推荐
Future<SpecialRecommendationResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommendationResult.formJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialRecommendationResult> getOneStopListAPI() async {
  // 返回请求
  return SpecialRecommendationResult.formJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, queryParameters: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}