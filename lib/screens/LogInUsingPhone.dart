import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Log.dart';

class LogInUsingPhone extends StatefulWidget {
  @override
  _LogInUsingPhoneState createState() => _LogInUsingPhoneState();
}

class _LogInUsingPhoneState extends State<LogInUsingPhone> {
  int currentStep = 0;
  bool refrech = false;
  bool valide = false;

  @override
  Widget build(BuildContext context) {
    print("build called valide is " + valide.toString());
    return SafeArea(
      child: Scaffold(
        body: Stepper(
          steps: [
            Step(
              state: currentStep > 0 ? StepState.complete : StepState.editing,
              isActive: currentStep == 0,
              title: Text("Phone number"),
              content: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
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
                      text: "phone",
                      icon: Icons.phone,
                      type: formtype.phone,
                      valide: (b) {
                        valide = b;
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          setState(() {});
                        });
                      },
                      valeur: (b) {},
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
              content: Text("here phone verification"),
            ),
          ],
          currentStep: currentStep,
          type: StepperType.horizontal,
          onStepTapped: (step) {
            if (step == 0) setState(() => currentStep = step);
          },
          controlsBuilder: removeButtons,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_forward_sharp,
          ),
          backgroundColor: valide ? Colors.blue : Colors.red,
          onPressed: () {
            setState(() {
              if (currentStep == 0 && valide) currentStep++;
            });
          },
        ),
      ),
    );
  }

  Widget removeButtons(BuildContext,
          {void Function() onStepCancel, void Function() onStepContinue}) =>
      Container();
}
