import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Demande.dart';
import 'package:ii_cpi_project/components/Post2.dart';

class Demandes extends StatefulWidget {
  @override
  _DemandesState createState() => _DemandesState();
}

class _DemandesState extends State<Demandes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
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
      body: ListView(
        children: [
          Demande(),
          Demande(),
          Demande(),
          Demande(),
          Demande(),
          Post2(),
          Post2(),
          Post2(),
        ],
      ),
    );
  }
}
