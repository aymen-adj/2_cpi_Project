import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/list-wilaya.dart';

class TrajetBox extends StatefulWidget {
  @override
  _TrajetBoxState createState() => _TrajetBoxState();
}

class _TrajetBoxState extends State<TrajetBox> {
  List<String> _traget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListWilayaWedget(
          onChooseTraget: (_) {},
        ),
      ),
    );
  }
}
