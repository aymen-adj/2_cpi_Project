import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/components/Formule.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_forward_sharp),
              backgroundColor: colorFAB,
              onPressed: () async {
                if (colorFAB == Colors.grey) {
                  showSnackBar("الرجاء مل الاسم و اللقب", context);
                } else {
                  thisUser.token = await getToken();
                  thisUser.firstName = fname;
                  thisUser.famillyName = lname;
                  //print("this user " + thisUser.phoneNumber);
                  thisUser.phoneNumber =
                      ModalRoute.of(context).settings.arguments as String;
                  thisUser.rateAsClient = 0;
                  thisUser.rateAsDriver = 0;

                  await createuser(thisUser.firstName, thisUser.famillyName,
                      thisUser.phoneNumber, thisUser.token);
                  bool a = await verifyNumber(phone: thisUser.phoneNumber);
                  if (a) {
                    Navigator.of(context).pushNamed('home');
                  }
                }
              },
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Image(
                        image: AssetImage("images/user.png"),
                      ),
                      height: 250,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: [
                          Formule(
                            text: "الإسم",
                            color: colorFName,
                            hint: "يرجى إدخال الإسم",
                            icon: Icons.account_circle,
                            // ignore: missing_return
                            validator: (value) {
                              if (value.length > 0) {
                                colorFName = Colors.blue;
                              } else
                                colorFName = Colors.grey;
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                setState(() {});
                              });

                              fname = value;
                              setTheColorOfFAB();
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Formule(
                            text: "اللقب",
                            color: colorLName,
                            hint: "يرجى إدخال اللقب",
                            icon: Icons.account_circle,
                            // ignore: missing_return
                            validator: (value) {
                              if (value.length > 0) {
                                colorLName = Colors.blue;
                              } else
                                colorLName = Colors.grey;
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                setState(() {});
                              });
                              lname = value;
                              setTheColorOfFAB();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
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

Future<String> getToken() async {
  String s = await FirebaseMessaging.instance.getToken();
  return s;
}
