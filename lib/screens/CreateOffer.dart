import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/components/PathChooser.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';

import '../constantes/Constants.dart';
import '../constantes/Functions.dart';
import '../models/postClass.dart';

/*
class CreateOffer extends StatefulWidget {
  static final String id = 'create Offer';
  @override
  _CreateOfferState createState() => _CreateOfferState();
}

class _CreateOfferState extends State<CreateOffer> {
  DateTime pickedDate;
  TimeOfDay time;
  List<String> traget = [];
  String vehicle;
  String description;

  @override
  void initState() {
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Choix de trajet"),
      ),
      body: Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return PathChooser.listWilaya(
                            onChoosePath: (choosedTrajet) {
                          traget = choosedTrajet;
                          setState(() {});
                        });
                      },
                    );
                  },
                  child: Text(
                    "اختر المسار ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SingleChildScrollView(
                    child: chipList(
                        TransformStringToChip(kWilayaNumerated.sublist(1, 3)))),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: BasicContainerWithShadow(
                    child: DropdownButton(
                      hint: Text("نوع المركبة"),
                      items: vehicles,
                      value: vehicle,
                      onChanged: (_) {
                        setState(() {
                          vehicle = _;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: _pickDate,
                        child: BasicContainerWithShadow(
                          child: Text(
                              "يوم الانطلاق: ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day}"),
                        ),
                      ),
                      GestureDetector(
                        onTap: _pickTime,
                        child: BasicContainerWithShadow(
                          child: Text("الوقت: ${time.hour}:${time.minute}"),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: BasicContainerWithShadow(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration:
                          InputDecoration(hintText: "مزيد من المعلومات"),
                      onChanged: (_) {
                        setState(() {
                          description = _;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // submit();
                          //   createPostToDB(postingDate, date, trajet, vehicule, description, postType)
                          Navigator.pop(context);
                        });
                      },
                      child: BasicContainerWithShadow(child: Text('OK')),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: BasicContainerWithShadow(child: Text('Cancel')),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (t != null) {
      setState(() {
        time = t;
      });
    }
  }

  void submit() {
    Posts.add(Post(
      userId: 1,
      postID: 01,
      postingDate: getPostingTime(),
      postType: 1,
      time: '${time.hour}:${time.minute}',
      date: '${pickedDate.year}/${pickedDate.month}/${pickedDate.day}',
      description: description == null ? '' : description,
      vehicule: vehicle == null ? 'NONE' : vehicle,
      trajet: traget.length > 0 ? traget : [''],
      phoneNumber: '540047893',
      image: Image.asset("images/logo.png"),
    ));
    print(vehicle);
    print(description);
  }
}
*/

class CreateOffer extends StatefulWidget {
  static const String id = 'create Offer';

  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  List<String> traget = [];
  String vehicle;
  String description;

  @override
  _CreateOfferState createState() => _CreateOfferState(
        pickedDate: pickedDate,
        pickedTime: pickedTime,
        description: description,
        traget: traget,
        vehicle: vehicle,
      );
}

class _CreateOfferState extends State<CreateOffer> {
  _CreateOfferState({
    @required this.pickedDate,
    @required this.pickedTime,
    @required this.description,
    @required this.traget,
    @required this.vehicle,
  });

  DateTime pickedDate;
  List<String> traget;
  String vehicle;
  String description;
  TimeOfDay pickedTime;
  // DateTime pickedDate = DateTime.now();
  // List<String> traget = [];
  // String vehicle;
  // String description;
  // TimeOfDay pickedTime = TimeOfDay.now();
  int currentStep = 0;
  bool isTrue1 = false;
  String timeLable = 'Choose Time';
  String dateLable = 'Choose Date';
  TextEditingController descriptionController = TextEditingController();
  StepState tragetState = StepState.editing;
  StepState dateState = StepState.indexed;
  StepState vehicleState = StepState.indexed;

  _selectTime() async {
    final TimeOfDay result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      {
        pickedTime = result;
        timeLable = pickedTime.format(context);
      }
    }
    if ((isTrue1) & (pickedTime != null) & (pickedDate != null)) {
      dateState = StepState.complete;
      isTrue1 = true;
    } else {
      dateState = StepState.error;
      isTrue1 = false;
    }
    setState(() {});
  }

  _selectDate() async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: pickedDate, // Refer step 1
      firstDate: DateTime(DateTime.now().day),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != pickedDate) {
      pickedDate = picked;
      dateLable = pickedDate.toString().substring(0, 10);
      if (pickedDate.isBefore(DateTime.now()))
        isTrue1 = false;
      else
        isTrue1 = true;
    }
    if ((isTrue1) & (pickedTime != null) & (pickedDate != null)) {
      dateState = StepState.complete;
      isTrue1 = true;
    } else {
      dateState = StepState.error;
      isTrue1 = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    descriptionController.text = description;
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
              if (currentStep == 0) if ((traget.length > 1) &
                  (traget.length < 9)) {
                setState(() {
                  tragetState = StepState.complete;
                  dateState = StepState.editing;
                  currentStep = 1;
                });
                return;
              } else
                setState(() {
                  tragetState = StepState.error;
                  return;
                });

              if ((currentStep == 1) &
                  (dateState == StepState.complete) &
                  (isTrue1)) {
                setState(() {
                  currentStep = 2;
                  vehicleState = StepState.editing;
                  return;
                });
              }

              if (currentStep == 2) if ((vehicle == null) ||
                  (descriptionController.text.isEmpty))
                setState(() {
                  vehicleState = StepState.error;
                  return;
                });
              else
                setState(() {
                  vehicleState = StepState.complete;
                  return;
                });

              if ((currentStep == 2) &
                  (vehicleState == StepState.complete) &
                  (tragetState == StepState.complete) &
                  (dateState == StepState.complete)) {
                PostClass post = PostClass(
                  date: dateLable,
                  time: timeLable,
                  description: descriptionController.text,
                  phoneNumber: thisUser.phoneNumber,
                  postingDate: DateTime.now().toUtc(),
                  trajet: [
                    stringToNumWilaya(traget),
                  ],
                  userId: thisUser.id,
                  vehicule: vehicle,
                );
                createPostToDB(post, "Offer");
                Navigator.pop(context);
              }
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
                state: tragetState,
                subtitle: Text('اختر الولايات التي تمر بها'),
                isActive: currentStep == 0,
                title: Text("اختر المسار"),
                content: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: PathChooser(
                    onChoosePath: (path) {
                      traget = path;
                      if ((traget.length < 2) || (traget.length > 9))
                        tragetState = StepState.error;
                      else
                        tragetState = StepState.complete;
                      print(tragetState);
                      setState(() {});
                    },
                  ),
                ),
              ),
              Step(
                subtitle: Text('اختر الوقت الذي تمر فيه'),
                state: dateState,
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
                state: vehicleState,
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
                        });
                      },
                    ),
                    TextField(
                      controller: descriptionController,
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
