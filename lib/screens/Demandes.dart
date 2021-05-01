import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class DemandesScreen extends StatefulWidget {
  @override
  _DemandesScreenState createState() => _DemandesScreenState();
}

class _DemandesScreenState extends State<DemandesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:Container(
          height: 100,
          child: ListView.builder(
              itemCount: kWilaya.length-1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int i){
                return Container(
                  color: Colors.amber,
                  height: 40,
                  width: 80,
                  child: Text(kWilaya[i]),) ;
              }),
        ),//TODO: implementation of this screen
      ),
    );
  }
}
