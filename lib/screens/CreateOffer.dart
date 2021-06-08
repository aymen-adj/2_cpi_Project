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
  @override
  _CreateOfferState createState() => _CreateOfferState();
}

class _CreateOfferState extends State<CreateOffer> {
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
  TextEditingController descriptionController = TextEditingController();

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
                      (isTrue2 == false))) {
                PostClass post = PostClass(
                  date: dateLable,
                  time: timeLable,
                  description: descriptionController.text,
                  phoneNumber: thisUser.phoneNumber,
                  postingDate: DateTime.now(),
                  trajet: [
                    stringToNumWilaya(traget),
                  ],
                  userId: thisUser.id,
                  vehicule: vehicle,
                );
                createPostToDB(post, "Offer");
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
                          if (descriptionController.text.isEmpty)
                            isTrue2 = false;
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
