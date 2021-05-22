import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Colors.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';
import 'package:ii_cpi_project/screens/CreateOffer.dart';

class Offers extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  Offers({this.scrollController});
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: ActiveColor,
            child: Icon(
              Icons.post_add_rounded,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, CreateOffer.id);
              });
            }),
        body: ListView.builder(
            itemCount: Posts.length,
            itemBuilder: (context, i) {
              return Posts[i];
            }));
  }
}
