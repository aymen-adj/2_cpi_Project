import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/list-wilaya.dart';
import 'package:ii_cpi_project/components/post.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';

class TrajetBox extends StatefulWidget {
  @override
  _TrajetBoxState createState() => _TrajetBoxState();
}

class _TrajetBoxState extends State<TrajetBox> {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: submit,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  height: 300,
                  width: double.infinity,
                  child: ListWilayaWedget.listWilaya(
                    onChooseTraget: (_) {
                      traget = _;
                      print(traget);
                    },
                  ),
                ),
                DropdownButton(
                  hint: Text("نوع المركبة"),
                  items: vehicles,
                  value: vehicle,
                  onChanged: (_) {
                    setState(() {
                      vehicle = _;
                    });
                  },
                ),
                ListTile(
                  title: Text(
                      "يوم الانطلاق: ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day}"),
                  onTap: _pickDate,
                ),
                ListTile(
                  title: Text("الوقت: ${time.hour}:${time.minute}"),
                  onTap: _pickTime,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(hintText: "مزيد من المعلومات"),
                  onChanged: (_){
                    setState(() {
                      description=_;
                    });
                  },
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
    Posts.add(
      Post(userId: 1, postID: 01, postingDate: '01/05/2021', postType: 1,
        time:  '${time.hour}:${time.minute}',
      date:'${pickedDate.year}/${pickedDate.month}/${pickedDate.day}',
      description: description,
        vehicule: vehicle,
        trajet: traget,
        phoneNumber: '0540047893',
        image: Image.asset("images/logo.png"),
      )
    );

    print(vehicle);
    print(description);

  }
}
