import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/BasicContainerWithShadow.dart';
import 'package:ii_cpi_project/components/appbar.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';
import 'package:ii_cpi_project/screens/create_offer.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  ScrollController scrollController = ScrollController();
  bool createPostVisible=false;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    Posts[0] = HomeAppBar(
      scrollController: scrollController,
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delivery_dining,size: 40,),
        onPressed: (){
          setState(() {
            createPostVisible=!createPostVisible;
          });
        },
      ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: Posts,
          ),
          createPostVisible? Center(child: Container(
              height: size.height-250,
              child: TrajetBox()),
          ):Container(),
        ],
      ),
    );
  }
}
