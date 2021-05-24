import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/LoadingPage.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';

class Demandes extends StatefulWidget {
  @override
  _DemandesState createState() => _DemandesState();
}

class _DemandesState extends State<Demandes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(
            () {
              Navigator.pushNamed(context, "create demandes");
            },
          );
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await getRefresh();
          setState(() {});
        },
        backgroundColor: Colors.white,
        color: Colors.blue,
        child: StreamBuilder(
            stream: importPosts(postType: demande),
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
