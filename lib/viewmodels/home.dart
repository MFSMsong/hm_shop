//轮播图类
import 'package:myproject/utils/DioRequest.dart';

class BannerItem {
  String id;
  String imageUrl;
  BannerItem({required this.id, required this.imageUrl});

  //工厂函数，一般用factor来声明，从json数据创建BannerItem对象
  factory BannerItem.formJSON(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? "", imageUrl: json['imgUrl'] ?? "");
  }
}

// {
//     "code": "1",
//     "msg": "操作成功",
//     "result": [
//         {
//             "id": "1181622001",
//             "name": "气质女装",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
//             "children": [
//                 {
//                     "id": "1191110001",
//                     "name": "半裙",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110002",
//                     "name": "衬衫",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110022",
//                     "name": "T恤",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110023",
//                     "name": "针织衫",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110024",
//                     "name": "夹克",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110025",
//                     "name": "卫衣",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_wy.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110028",
//                     "name": "背心",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622002",
//             "name": "女士内衣",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/nsny.png",
//             "children": [
//                 {
//                     "id": "1191110003",
//                     "name": "文胸",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_wx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110004",
//                     "name": "短袜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_dw.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110005",
//                     "name": "起居服",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110029",
//                     "name": "内裤",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_nk.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110030",
//                     "name": "连裤袜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_lkw.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110033",
//                     "name": "塑身衣/塑身裤",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110034",
//                     "name": "内衣套装",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622003",
//             "name": "箱包手袋",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/xbsd.png",
//             "children": [
//                 {
//                     "id": "1191110006",
//                     "name": "单肩包",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_djb.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110007",
//                     "name": "双肩包",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_sjb.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110008",
//                     "name": "手提包",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_stb.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110026",
//                     "name": "斜挎包",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_xkb.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622004",
//             "name": "时尚饰品",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/sssp.png",
//             "children": [
//                 {
//                     "id": "1191110009",
//                     "name": "耳饰",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_es.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110010",
//                     "name": "项链",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_xl.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110011",
//                     "name": "手链/手镯",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_sz.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110012",
//                     "name": "戒指",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_jz.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110014",
//                     "name": "挂饰及其他",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_js.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622005",
//             "name": "服饰配件",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/zspj.png",
//             "children": [
//                 {
//                     "id": "1191110015",
//                     "name": "渔夫帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_yfm.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110016",
//                     "name": "贝雷帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_blm.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110017",
//                     "name": "报童帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_baotongmao.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110018",
//                     "name": "草帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_cm.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110036",
//                     "name": "手套",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_st.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110037",
//                     "name": "围巾丝巾",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_wjsj.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110040",
//                     "name": "针织帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_zzm.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622006",
//             "name": "时尚女鞋",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/ssnx.png",
//             "children": [
//                 {
//                     "id": "1191110042",
//                     "name": "休闲鞋",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/ssnx_xxx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622009",
//             "name": "眼镜配件",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/yypj.png",
//             "children": [
//                 {
//                     "id": "1191110020",
//                     "name": "太阳镜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/yjpj_tyj.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110021",
//                     "name": "光学眼镜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/yjpj_gxyj.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         }
//     ]
// }

//根据json生成类和工厂函数
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    required this.children,
  });

  //工厂函数，一般用factor来声明，从json数据创建CategoryItem对象
  factory CategoryItem.formJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      picture: json['picture'] ?? "",
      //注意children的类型转换，需要先判断是否为空，再转换
      children: json['children'] == null
          ? null :
                (json['children'] as List)
                .map((item) => CategoryItem.formJSON(item as Map<String, dynamic>))
                .toList(),
    );
  }
}

//特惠推荐商品项
class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;
  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.formJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      desc: json['desc'],
      price: json['price'] ?? "0.00",
      picture: json['picture'] ?? "",
      orderNum: json['orderNum'] ?? 0,
    );
  }
}

//商品项集合
class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;
  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.formJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 10,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 1,
      items: (json['items'] as List)
          .map((item) => GoodsItem.formJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

//子类型
class SubType {
  String id;
  String title;
  GoodsItems goodsItems;
  SubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory SubType.formJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      goodsItems: GoodsItems.formJson(json['goodsItems'] as Map<String, dynamic>),
    );
  }
}

//特惠推荐
class SpecialRecommendationResult {
  String id;
  String title;
  List<SubType> subTypes;
  SpecialRecommendationResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommendationResult.formJson(Map<String, dynamic> json) {
    return SpecialRecommendationResult(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      subTypes: (json['subTypes'] as List)
          .map((item) => SubType.formJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

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

