import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Formule.dart';

class LogInUsingPhone extends StatefulWidget {
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
  Future Connect() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+213" + number.substring(1),
      verificationCompleted: (credential) {
        _auth.signInWithCredential(credential).then((value) {
          Navigator.popAndPushNamed(context, 'home');
        });
      },
      timeout: Duration(seconds: 120),
      verificationFailed: (erreur) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Capatcha Error "),
                  content: Text('Please Repeat The Capatcha'),
                ));
      },
      codeSent: (code, val) {
        _verification = code;
      },
      codeAutoRetrievalTimeout: (value) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              title: Text("Phone number",
                  style: TextStyle(
                    color: _color,
                  )),
              content: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Text(
                      "Enter your phone number ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Formule(
                      maxLength: 10,
                      text: "Phone",
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
                        } else if (!ValidNumber(value)) {
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
                title: Text("Phone verification"),
                content: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Text(
                      'Drop The OTP here',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    TextField(
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _otp = value;
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
                  currentStep++;
                  _color = Colors.black;
                });
                Connect();
              } else {
                final snackbar =
                    SnackBar(content: Text('Please Enter a Valid Number !'));

                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            } else {
              if (_otp.length != 6) {
                final snackBar =
                    SnackBar(content: Text('Please Enter a Valid otp'));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else
                _auth
                    .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verification, smsCode: _otp))
                    .then((value) {
                  Navigator.popAndPushNamed(context, 'home');
                }).onError((error, stackTrace) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text("Please enter the right otp"),
                          ));
                });
            }
          },
        ),
      ),
    );
  }

  Widget removeButtons(BuildContext,
          {void Function() onStepCancel, void Function() onStepContinue}) =>
      Container();
}
