import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ii_cpi_project/components/Formule.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color ColorFName = Colors.grey;
  Color ColorFAB = Colors.grey;
  Color ColorLName = Colors.grey;
  String fname = "", lname = "";

  void setTheColorOfFAB() {
    if (ColorLName == Colors.grey || ColorLName == Colors.grey) {
      ColorFAB = Colors.grey;
    } else if (ColorLName == Colors.red || ColorFName == Colors.red) {
      ColorFAB = Colors.red;
    } else if (ColorLName == Colors.blue && ColorLName == Colors.blue) {
      ColorFAB = Colors.blue;
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
        backgroundColor: ColorFAB,
        onPressed: () {
          if (ColorFAB == Colors.grey) {
            showSnackBar("الرجاء ادخال الاسم و اللقب", context);
          } else if (ColorFAB == Colors.red) {
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
                            icon: Icons.add,
                            text: "الاسم",
                            color: ColorFName,
                            validator: (value) {
                              fname = value;
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Formule(
                            icon: Icons.add,
                            text: "اللقب",
                            color: ColorLName,
                            validator: (value) {
                              lname = value;
                              String validator;
                              if (value == "") {
                                validator = null;
                                ColorLName = Colors.grey;
                              } else if (value == "moh") {
                                ColorLName = Colors.blue;
                              } else {
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
