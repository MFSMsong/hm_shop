import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myproject/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  HmSlider({Key? key,required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }
  
  Widget _getSlider() {
    //返回轮播图插件
    return CarouselSlider(
      items: List.generate(
        widget.bannerList.length,
        (index) => Container(
          child: Image.network(
            widget.bannerList[index].imageUrl!,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            ),
        ),
      ),
      options: CarouselOptions(
        
        height: 200,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 3),
        aspectRatio: 16/9,
      ),
    );
  }
}
