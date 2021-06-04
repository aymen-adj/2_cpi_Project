import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ii_cpi_project/components/Formule.dart';

class SignUp extends StatefulWidget {
  static String id = "SignUp";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color colorFName = Colors.grey;
  Color colorFAB = Colors.grey;
  Color colorLName = Colors.grey;
  String fname = "", lname = "";

  void setTheColorOfFAB() {
    if (colorLName == Colors.blue && colorFName == Colors.blue) {
      colorFAB = Colors.blue;
    } else if (colorLName == Colors.grey || colorFName == Colors.grey) {
      colorFAB = Colors.grey;
    }
    if (colorLName == Colors.red || colorFName == Colors.red) {
      colorFAB = Colors.red;
      print("red");
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_sharp),
        backgroundColor: colorFAB,
        onPressed: () {
          if (colorFAB == Colors.grey) {
            showSnackBar("الرجاء مل الاسم و اللقب", context);
          } else if (colorFAB == Colors.red) {
            showSnackBar("الرجاء ادخال الاسم و اللقب صحيحان", context);
          } else {}
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        textDirection: TextDirection.rtl,
                        children: [
                          Formule(
                            text: "الاسم",
                            color: colorFName,
                            validator: (value) {
                              fname = value;
                              String validator;
                              if (value == "") {
                                validator = null;
                                colorFName = Colors.grey;
                              } else if (value == "moh") {
                                colorFName = Colors.blue;
                              } else {
                                colorFName = Colors.red;
                                validator = null;
                              }
                              setTheColorOfFAB();
                              return validator;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Formule(
                            text: "اللقب",
                            color: colorLName,
                            validator: (value) {
                              lname = value;
                              String validator;
                              if (value == "") {
                                validator = null;
                                colorLName = Colors.grey;
                              } else if (value == "moh") {
                                colorLName = Colors.blue;
                              } else {
                                colorLName = Colors.red;
                                validator = null;
                              }
                              setTheColorOfFAB();
                              return validator;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showSnackBar(String g, BuildContext context) {
  SnackBar snackBar = SnackBar(
      content: Directionality(
    child: Text(g),
    textDirection: TextDirection.rtl,
  ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
