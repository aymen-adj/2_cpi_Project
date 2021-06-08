import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/screens/LogInUsingPhone.dart';
import 'package:ii_cpi_project/screens/Welcom.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => goToNext(context));
  }
}

void goToNext(BuildContext context) async {
  await Future.delayed(Duration(seconds: 5));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Widget t;
  if ((prefs.getBool('new') ?? true)) {
    t = Welcom();
  } else if (!(prefs.getBool('logIn') ?? false)) {
    t = LogInUsingPhone();
  } else {
    t = Home();
    thisUser = await getUserFromSharedPrefs();
  }
  Navigator.of(context).push(MaterialPageRoute(builder: (builder) => t));
}
