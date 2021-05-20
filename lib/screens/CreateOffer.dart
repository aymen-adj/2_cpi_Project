import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/BasicContainerWithShadow.dart';
import 'package:ii_cpi_project/components/Chips.dart';
import 'package:ii_cpi_project/components/PathChooser.dart';
import 'package:ii_cpi_project/components/Post.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';

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
      body: Center(
        child: BasicContainerWithShadow(
          child: Container(
            height: size.height * 0.59,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
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
                        child:
                            chipList(TransformStringToChip(kWilayaNumerated))),
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
                              submit();
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
                          child:
                              BasicContainerWithShadow(child: Text('Cancel')),
                        )
                      ],
                    ),
                  ],
                ),
              ),
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
      firstDate: DateTime(DateTime.now().year),
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
