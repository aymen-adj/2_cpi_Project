import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/components/DialogFilter.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/screens/CreateOffer.dart';
import 'package:ii_cpi_project/screens/Demandes.dart';

// ignore: must_be_immutable
class Offers extends StatefulWidget {
  static final String id = 'Offers';
  ScrollController scrollController = ScrollController();
  Offers({this.scrollController});
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            //  backgroundColor: ActiveColor,
            child: Icon(
              Icons.post_add_rounded,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () async {
              setState(() {
                Navigator.pushNamed(context, CreateOffer.id);
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
              stream: DialogFilter.isSearching
                  ? searchForPost(
                      postType: "Offer",
                      arrive: DialogFilter.traget.last,
                      depart: DialogFilter.traget.first,
                      vehicle: getNumOfVehicule(DialogFilter.vehicule),
                    )
                  : importPosts(postType: "Offer"),
              builder: (context, snapshot) {
                List body = [];
                if (snapshot.hasData) {
                  for (int k = 0; k < snapshot.data.length; k++) {
                    body.add(snapshot.data[snapshot.data.length - k - 1]);
                  }
                }
                return (snapshot.hasError ||
                        !snapshot.hasData ||
                        snapshot.data == null)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        controller: widget.scrollController,
                        itemCount: body.length,
                        itemBuilder: (context, i) {
                          return body[i]; // snapshot.data[i];
                        },
                      );
              }),
        ),
      ),
    );
  }
}
void getToken() async {
  String s=await FirebaseMessaging.instance.getToken();
  print("mosbah "+s);
}