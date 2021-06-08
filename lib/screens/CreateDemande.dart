import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/PathChooser.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';

class CreateDemande extends StatefulWidget {
  static const String id = "create demandes";
  @override
  _CreateDemandeState createState() => _CreateDemandeState();
}

class _CreateDemandeState extends State<CreateDemande> {
  DateTime pickedDate = DateTime.now();
  List<String> traget = [];
  String vehicle;
  String description;
  int currentStep = 0;
  bool isTrue0 = true;
  bool isTrue1 = false;
  bool isTrue2 = true;
  String timeLable = 'Choose Time';
  String dateLable = 'Choose Date';
  TextEditingController controller = TextEditingController();

  TimeOfDay pickedTime = TimeOfDay.now();

  // ignore: missing_return
  StepState stepState(int step, bool isTrue) {
    if (step > currentStep)
      return StepState.indexed;
    else if ((!isTrue) && (currentStep == step))
      return StepState.error;
    else if (step == currentStep)
      return StepState.editing;
    else if ((step < currentStep) && (isTrue))
      return StepState.complete;
    else if (isTrue == null) return StepState.editing;
  }

  _selectTime() async {
    final TimeOfDay result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        pickedTime = result;
        timeLable = pickedTime.format(context);
      });
    }
  }

  _selectDate() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: pickedDate, // Refer step 1
      firstDate: DateTime(DateTime.now().day),
      lastDate: DateTime(2025),
    );
    print('alpha');
    if (picked != null && picked != pickedDate)
      setState(() {
        pickedDate = picked;
        dateLable = pickedDate.toString().substring(0, 10);
        if (pickedDate.isBefore(DateTime.now()))
          isTrue1 = false;
        else
          isTrue1 = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.arrow_downward_outlined,
            ),
            onPressed: () {
              if ((isTrue0) &&
                  (currentStep == 0) &&
                  (traget.length > 1) &&
                  (traget.length < 9)) currentStep++;
              if ((isTrue1) && (currentStep == 1)) currentStep++;
              print(currentStep);
              // currentStep++;
              //Logic true1
              //Logic true2

              if ((currentStep == 2) &&
                  ((isTrue0 == false) ||
                      (isTrue1 == false) ||
                      (isTrue2 == false))) print('alpha');
//              createPostToDB(post, "Offer");
              setState(() {});
            },
          ),
          body: Stepper(
            physics: ScrollPhysics(),
            type: StepperType.vertical,
            currentStep: currentStep,
            onStepTapped: (step) {
              if (step < currentStep) currentStep = step;
              print(step);
              setState(() {});
            },
            controlsBuilder: removeButtons,
            steps: [
              Step(
                state: stepState(0, isTrue0),
                subtitle: Text('اختر الولايات التي تمر بها'),
                isActive: currentStep == 0,
                title: Text("اختر المسار"),
                content: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: PathChooser(
                    onChoosePath: (path) {

                      traget = path;
                      if ((traget.length < 2) || (traget.length > 9))
                        isTrue0 = false;
                      else
                        isTrue0 = true;
                      print(traget);
                      setState(() {});
                    },
                  ),
                ),
              ),
              Step(
                subtitle: Text('اختر الوقت الذي تمر فيه'),
                state: stepState(1, isTrue1),
                isActive: currentStep == 1,
                title: Text('اختر الوقت'),
                content: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _selectDate();
                      },
                      icon: Icon(Icons.calendar_today),
                      label: Text(dateLable),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _selectTime();
                      },
                      icon: Icon(Icons.watch_later_sharp),
                      label: Text(timeLable),
                    ),
                  ],
                ),
              ),
              Step(
                isActive: currentStep == 2,
                state: stepState(2, isTrue2),
                subtitle: Text('اختر وسيلة النقل المناسبة '),
                title: Text('اختر الآلة'),
                content: Column(
                  children: [
                    DropdownButton(
                      hint: Text("نوع المركبة"),
                      items: vehicles,
                      value: vehicle,
                      icon: Icon(Icons.directions_car),
                      autofocus: true,
                      onChanged: (value) {
                        setState(() {
                          vehicle = value;
                          if (controller.text.isEmpty) isTrue2 = false;
                        });
                      },
                    ),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter a description',
                        labelText: 'Description',
                        icon: Icon(
                          Icons.directions_car,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget removeButtons(context,
      {void Function() onStepCancel, void Function() onStepContinue}) =>
      Container();
}
