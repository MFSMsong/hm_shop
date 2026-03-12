 import 'package:flutter/material.dart';
import 'package:myproject/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommendationResult? specialRecommendationResult;
  HmSuggestion({Key? key, this.specialRecommendationResult}) : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {

  List<GoodsItem> _getDisplayItems(){
    return widget.specialRecommendationResult!.subTypes.first.goodsItems.items.take(3).toList();
  }

  List<Widget> _getChildrenList(){
    List<GoodsItem> items = _getDisplayItems();
    return List.generate(
      items.length,
      (int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              //图片错误时返回一个未加载的图片
              errorBuilder: (context, error, stackTrace) => Image.asset('assets/home_cmd_inner.png',width: 100,height: 100,),
              items[index].picture,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
              alignment: Alignment.center,
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 249, 77, 34),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(items[index].price,style: TextStyle(fontSize: 12,color: const Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold),),
            ),
            
          ],
        );
      }
    );
  }

  //完成渲染
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         image: DecorationImage(
           image: AssetImage("home_cmd_sm.png"),
           fit: BoxFit.cover,
         ),
       ),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 10,),
          Row(
            children:[
              _buildLeft(),
              SizedBox(width: 20,),
              Expanded(
                child: Row(
                  children: _getChildrenList(),
                )
                ),
            ]
          ),
          ]
        ),
    );
  }
  
  //构建头部
  Widget _buildHeader() {
    return Row(
      children: [
        Text('特惠推荐 ',style: TextStyle(fontSize: 18,color: const Color.fromARGB(255, 86, 24, 20),fontWeight: FontWeight.bold,),),
        SizedBox(width: 10,),
        Text('精选省攻略',style: TextStyle(fontSize: 12,color: const Color.fromARGB(255, 124, 63, 58)),),
      ],
    );
  }
  
  _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  
  _buildRight() {
     return Container(
      
    );
  }
}
