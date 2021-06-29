import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/UserAppCard.dart';

class MyApplicaions extends StatelessWidget {
  static const String id = "appliations";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "تعاملاتي",
              style: TextStyle(fontSize: 30),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                UserAppCard(
                  status: false,
                  user_name: "دريس ياسين",
                  user_type: true,
                ),
                UserAppCard(
                  status: true,
                  user_name: "زاكي هبال",
                  user_type: false,
                ),
                UserAppCard(
                  user_name: "عجلان ايمن",
                  user_type: true,
                  status: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
