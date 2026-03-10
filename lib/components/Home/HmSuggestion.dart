 import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  HmSuggestion({Key? key}) : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
       alignment: Alignment.center,
       color: Colors.blue,
       height: 200,
       child:Text('推荐',style: TextStyle(fontSize: 16,color: Colors.white),),
    );
  }
}
