import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/screens/LogInUsingPhone.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isNew', false);
          print(thisUser);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (builder) => LogInUsingPhone()));
        },
      ),
    );
  }
}
