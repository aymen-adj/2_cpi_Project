import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/appbar.dart';
import 'package:ii_cpi_project/components/post.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController= ScrollController();
  @override
  Widget build(BuildContext context) {
    Posts[0]= HomeAppBar(scrollController: scrollController,);
    return Scaffold(
      body: CustomScrollView(
        controller:scrollController,
         slivers: Posts,
      ),
    );
  }
}






// ListView.builder(
// itemCount:Posts.length,
//
// itemBuilder: (BuildContext context , int i){
// return Posts[i];
// })


