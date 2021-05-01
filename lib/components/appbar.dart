import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class HomeAppBar extends StatefulWidget {
  ScrollController scrollController;
  HomeAppBar({this.scrollController});
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isSearching=false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SliverAppBar(
        centerTitle: false,
        expandedHeight: 60,
        title:isSearching? TextField(

        ): GestureDetector(
          onTap: (){
          setState(() {
            widget.scrollController.animateTo(widget.scrollController.initialScrollOffset,
                duration: Duration(milliseconds: 2000),
                curve: Curves.easeOut);
          });
          },
          child: Text('طلبات التوصيل',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
            textDirection: TextDirection.ltr,
          ),
        ),
        floating: true,
        actions: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black26
            ),
            child: IconButton(icon: Icon(isSearching? Icons.cancel : Icons.search,size: 30,), onPressed: (){
              setState(() {
                isSearching=!isSearching;
              });
            }),
          )
        ],
      ),
    );
  }
}
