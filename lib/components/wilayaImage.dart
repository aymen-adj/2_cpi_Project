import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';

class WilayatImages extends StatefulWidget {
  @override
  _WilayatImagesState createState() => _WilayatImagesState();
}

class _WilayatImagesState extends State<WilayatImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView.builder(
          itemCount: kWilaya.length,
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(16)
                      ),
                      margin: EdgeInsets.all(6),
                      width: 85,
                      child: Center(
                          child: Image.asset(
                        'images/logo.png',
                      ))),
                  Text(
                    wilayat[i],
                    style: TextStyle(fontSize: 19),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
