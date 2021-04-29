import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/list-wilaya.dart';

class TrajetBox extends StatefulWidget {
  @override
  _TrajetBoxState createState() => _TrajetBoxState();
}

class _TrajetBoxState extends State<TrajetBox> {
  DateTime pickedDate;
  TimeOfDay time;
  List<String> _traget;

  @override
  void initState() {
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
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
                child: ListWilayaWedget(
                  onChooseTraget: (_) {},
                ),
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
              SizedBox(
                height: 100,
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  minLines: 3,
                ),
              ),
            ],
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
}
