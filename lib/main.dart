import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/First.dart';
import 'package:ii_cpi_project/screens/home.dart';
import 'package:ii_cpi_project/screens/profileScreen.dart';

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
       ProfileScreen.id :(context) => ProfileScreen(),

      },
    ),
  );
}
