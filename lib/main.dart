import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/CreateDemande.dart';
import 'package:ii_cpi_project/screens/CreateOffer.dart';
import 'package:ii_cpi_project/screens/Home.dart';

import 'package:ii_cpi_project/screens/Profile.dart';
import 'package:ii_cpi_project/screens/SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        ProfileScreen.id: (context) => ProfileScreen(),
        CreateOffer.id: (context) => CreateOffer(),
        CreateDemande.id: (context) => CreateDemande(),
      },
    ),
  );
}
