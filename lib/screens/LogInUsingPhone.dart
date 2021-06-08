import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/components/Formule.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/screens/SignUp.dart';

class LogInUsingPhone extends StatefulWidget {
  static final String id = 'LoginPhone';
  @override
  _LogInUsingPhoneState createState() => _LogInUsingPhoneState();
}

class _LogInUsingPhoneState extends State<LogInUsingPhone> {
  int currentStep = 0;
  bool valide = true;
  Color _color = Colors.blue;
  String number = "";
  Color _colorstep2 = Colors.grey;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _verification;
  String _otp;
  bool isLoading = false;
  Future connect() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+213" + number.substring(1),
      verificationCompleted: (credential) {
        _auth.signInWithCredential(credential).then((value) {
          print("mosbah");
          gotoHome();
        });
      },
      timeout: Duration(seconds: 60),
      verificationFailed: (erreur) {
        setState(() {
          isLoading = false;
          currentStep--;
        });
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("خطأ في التحقق"),
                  content: Text('يرجى إعادة إدخال رقم الهاتف'),
                ));
      },
      codeSent: (code, val) {
        setState(() {
          isLoading = false;
        });
        _verification = code;
        print(_verification);
      },
      codeAutoRetrievalTimeout: (value) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stepper(
            steps: [
              Step(
                state: currentStep != 0
                    ? StepState.complete
                    : (number.length == 0
                        ? StepState.indexed
                        : (valide ? StepState.editing : StepState.error)),
                isActive: currentStep == 0,
                title: Text("رقم الهاتف",
                    style: TextStyle(
                      color: _color,
                    )),
                content: Center(
                  child: Column(
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage("images/phone.png"),
                        ),
                        height: 200,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Formule(
                        maxLength: 10,
                        text: "رقم الهاتف",
                        color: _color,
                        keyboardtype: TextInputType.number,
                        icon: Icons.phone,
                        hint: "يرجى إدخال رقم الهاتف",
                        validator: (value) {
                          valide = true;
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            setState(() {
                              number = value;
                            });
                          });

                          if (number.length == 0) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              setState(() {
                                _color = Colors.grey;
                              });
                              return null;
                            });
                          } else if (!validNumber(value)) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              setState(() {
                                _color = Colors.red;
                                valide = false;
                              });
                            });
                          } else {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              setState(() {
                                _color = Colors.blue;
                              });
                            });
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                  state: currentStep == 1
                      ? (valide ? StepState.editing : StepState.error)
                      : StepState.indexed,
                  isActive: currentStep == 1,
                  title: Text("تأكيد رقم الهاتف"),
                  content: (isLoading)
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            Container(
                              child: Image(image: AssetImage("images/msg.png")),
                              height: 200,
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            TextField(
                              decoration:
                                  InputDecoration(hintText: "أدخل رمز التأكيد"),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                _otp = value;
                                print(value);
                                if (value.length == 0)
                                  setState(() {
                                    _colorstep2 = Colors.grey;
                                  });
                                else if (value.length != 6)
                                  setState(() {
                                    _colorstep2 = Colors.red;
                                  });
                                else
                                  setState(() {
                                    _colorstep2 = Colors.blue;
                                  });
                              },
                            ),
                          ],
                        )),
            ],
            currentStep: currentStep,
            type: StepperType.horizontal,
            onStepTapped: (step) {
              if (step == 0 && valide) setState(() => currentStep = step);
            },
            controlsBuilder: removeButtons,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.arrow_forward_sharp,
            ),
            backgroundColor: (currentStep == 0) ? _color : _colorstep2,
            onPressed: () async {
              if (currentStep == 0) {
                if (valide && number.length != 0) {
                  setState(() {
                    isLoading = true;
                    currentStep++;
                    _color = Colors.black;
                  });
                  connect();
                } else {
                  final snackbar =
                      SnackBar(content: Text('يرجى إدخال رقم هاتف صحيح'));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              } else {
                if (_otp.length != 6) {
                  final snackBar =
                      SnackBar(content: Text('يرجى إدخال رمز تأكيد صحيح'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else
                  await _auth
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verification, smsCode: _otp))
                      .then((value) {
                    thisUser.phoneNumber = number.substring(1);
                    Navigator.popAndPushNamed(context, 'home');
                  }).onError((error, stackTrace) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Text("يرجى إدخال رقم التأكيد الصحيح"),
                            ));
                  });
              }
            },
          ),
        ),
      ),
    );
  }

  Widget removeButtons(context,
          {void Function() onStepCancel, void Function() onStepContinue}) =>
      Container();

  void gotoHome() async {
    bool numberExist = false;
    await verifyNumber(phone: number.substring(1))
        .then((value) => numberExist = value);
    if (numberExist) {
      //verifyNumber(phone: number)!=null
      Navigator.popAndPushNamed(context, 'home');
    } else {
      Navigator.popAndPushNamed(context, SignUp.id,arguments: number);
    }
  }
}
