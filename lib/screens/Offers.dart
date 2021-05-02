import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/appbar.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Posts[0] = HomeAppBar(
      scrollController: scrollController,
    );
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: Posts,
      ),
    );
  }
}
