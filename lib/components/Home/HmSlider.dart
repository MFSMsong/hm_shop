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
  CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(),_getDots()]);  
  }
  
  Widget _getSlider() {
    //返回轮播图插件
    return CarouselSlider(
      carouselController: _carouselController,
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
        onPageChanged: (index,reason) {
          _currentIndex = index;
          setState(() {
            
          });
        },
        height: 200,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 3),
        aspectRatio: 16/9,
      ),
    );
  }

  Widget _getDots() {
    //返回轮播图下方的小点点
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.bannerList.length,
          (index) => GestureDetector(
            onTap: () {
              _carouselController.animateToPage(index);
            },
            child: AnimatedContainer(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            width: (index == _currentIndex) ? 40 : 20,
            height: 8,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: (index == _currentIndex) ? Colors.white : Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
