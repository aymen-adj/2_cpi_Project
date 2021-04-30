import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
      },
    ),
  );
}
