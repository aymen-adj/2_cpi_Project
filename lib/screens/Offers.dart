import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/components/LoadingPage.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/screens/CreateOffer.dart';

// ignore: must_be_immutable
class Offers extends StatefulWidget {
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
              verifyNumber(phone: "540047893");
            //  Navigator.pushNamed(context, CreateOffer.id);
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
            // initialData: CircularProgressIndicator(),
            stream: importPosts(postType: "Offer"),
            builder: (context, snapshot) {
              print('sjjjjj    ' + snapshot.toString());
              return snapshot.hasError ||
                      !snapshot.hasData ||
                      snapshot.data == null
                  ? LoadingPage()
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return snapshot.data[i];
                      },
                    );
            }),
      ),
    );
  }
}
