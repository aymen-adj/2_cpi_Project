import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Log.dart';

class LogInUsingPhone extends StatefulWidget {
  @override
  _LogInUsingPhoneState createState() => _LogInUsingPhoneState();
}

class _LogInUsingPhoneState extends State<LogInUsingPhone> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_sharp),
          onPressed: () {
            setState(() {
              if (currentStep == 0) currentStep++;
            });
          },
        ),
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
                      valide: (b) {},
                      valeur: (b) {},
                    ),
                  ],
                ),
              ),
            ),
            Step(
              state: currentStep == 1 ? StepState.editing : StepState.indexed,
              isActive: currentStep == 1,
              title: Text("Phone verification"),
              content: Center(
                child: Text("here phon e verification"),
              ),
            ),
          ],
          currentStep: currentStep,
          type: StepperType.horizontal,
          onStepTapped: (step) {
            if (step == 0) setState(() => currentStep = step);
          },
          controlsBuilder: removeButtons,
        ),
      ),
    );
  }

  Widget removeButtons(BuildContext,
          {void Function() onStepCancel, void Function() onStepContinue}) =>
      Container();
}
