import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/appbar.dart';
import 'package:ii_cpi_project/constantes/Colors.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';
import 'package:ii_cpi_project/screens/CreateOffer.dart';

class Offers extends StatefulWidget {
  static bool createPostVisible = false;
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: ActiveColor,
          child: Icon(
            !Offers.createPostVisible ? Icons.post_add_rounded : Icons.cancel,
            size: 40,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (b) {
                  return Dialog(
                    insetAnimationCurve: Curves.ease,
                    backgroundColor: Colors.transparent,
                    insetAnimationDuration: Duration(milliseconds: 3000),
                    child: CreateOffer(),
                  );
                });
          }),
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: Posts,
          ),
          //Offers.createPostVisible ? CreateOffer() : Container(),
          Offers.createPostVisible
              ? Dialog(
                  insetAnimationCurve: Curves.ease,
                  backgroundColor: Colors.transparent,
                  insetAnimationDuration: Duration(milliseconds: 3000),
                  child: CreateOffer(),
                )
              : Container(),
        ],
      ),
    );
  }

  void _appearenceOfCreateOffer() {
    setState(() {
      Offers.createPostVisible = !Offers.createPostVisible;
    });
  }
}
