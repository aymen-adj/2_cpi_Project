import 'package:flutter/material.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/components/LoadingPage.dart';
import 'package:ii_cpi_project/components/editPost.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';

class MyOffers extends StatefulWidget {
  static final String id ='MyOffers';
  @override
  _MyOffersState createState() => _MyOffersState();
}

class _MyOffersState extends State<MyOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //  backgroundColor: ActiveColor,
          child: Icon(
            Icons.post_add_rounded,
            size: 40,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
            });
          }),
      body: RefreshIndicator(
        onRefresh: () async {
          await getRefresh();
          setState(() {});
        },
        backgroundColor: Colors.white,
        color: Colors.blue,
        child: StreamBuilder(
            stream: importUserPosts(table: "Offer"),
            builder: (context, snapshot) {

              return (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data == null)
                  ? LoadingPage()
                  : ListView.builder(
                itemCount: snapshot.data.length,//snapshot.data.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      snapshot.data[i],
                   EditPost(),
                    ],
                  ) ;//snapshot.data[i] ;
                },
              );
            }),
      ),
    );
  }
  }



