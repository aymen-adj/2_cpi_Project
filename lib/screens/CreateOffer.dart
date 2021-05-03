import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/BasicContainerWithShadow.dart';
import 'package:ii_cpi_project/components/Post.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';
import 'package:ii_cpi_project/screens/Offers.dart';

class CreateOffer extends StatefulWidget {
  static final String id = 'create Offer';
  @override
  _CreateOfferState createState() => _CreateOfferState();
}

class _CreateOfferState extends State<CreateOffer> {
  DateTime pickedDate;
  TimeOfDay time;
  List<String> traget;
  String vehicle;
  String description;
  List<DropdownMenuItem<String>> vehicles = [
    DropdownMenuItem(value: "شاحنة", child: Text("شاحنة")),
    DropdownMenuItem(value: "سيارة", child: Text("سيارة")),
    DropdownMenuItem(value: "دراجة", child: Text("دراجة")),
  ];

  @override
  void initState() {
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: BasicContainerWithShadow(
        child: Container(
          height: size.height * 0.59,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "اختيار المسار : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
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
                            Offers.createPostVisible = false;
                          });
                        },
                        child: BasicContainerWithShadow(child: Text('OK')),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Offers.createPostVisible = false;
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
      phoneNumber: '0540047893',
      image: Image.asset("images/logo.png"),
    ));

    print(vehicle);
    print(description);
  }
}
