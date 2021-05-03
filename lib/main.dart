import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/Home.dart';
import 'package:ii_cpi_project/screens/Profile.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    ),
  );
}
