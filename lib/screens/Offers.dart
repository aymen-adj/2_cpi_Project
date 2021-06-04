import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/components/LoadingPage.dart';
import 'package:ii_cpi_project/components/headOfHome.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/screens/CreateOffer.dart';

// ignore: must_be_immutable
class Offers extends StatefulWidget {
  static final String id ='Offers';
  ScrollController scrollController = ScrollController();
  Offers({this.scrollController});
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
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
            stream: importPosts(postType: "Offer"),
            builder: (context, snapshot)  {
              List body=[Header()];
if (snapshot.hasData){
  snapshot.data.forEach((element) {body.add(element);});
}
return (snapshot.hasError ||
                      !snapshot.hasData ||
                      snapshot.data.length ==null )
                  ? LoadingPage()
                  : ListView.builder(
                    itemCount: body.length,
                    itemBuilder: (context, i) {
                      return body[i] ;// snapshot.data[i];
                    },
                  );
            }),
      ),
    );
  }
}
