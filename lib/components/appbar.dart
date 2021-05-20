import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/components/DialogFiler.dart';

class HomeAppBar extends StatefulWidget {
  ScrollController scrollController;
  HomeAppBar({this.scrollController});

  static List<String> traget = [null, null];
  static String vehicule;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String Wilaya;
  DateTime pickedDate;

  @override
  void initState() {
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SliverAppBar(
        centerTitle: false,
        expandedHeight: 60,
        title: Text(
          'طلبات التوصيل',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
          textDirection: TextDirection.ltr,
        ),
        floating: true,
        actions: [
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black26),
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return DialogFilter();
                      });
                }),
          ),
        ],
      ),
    );
  }
}
