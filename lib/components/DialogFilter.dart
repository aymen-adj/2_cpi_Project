import 'package:flutter/material.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/components/SearchFilter.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';

class DialogFilter extends StatefulWidget {
  static List<String> traget = ["", ""];
  static String vehicule;
  static DateTime date;
  static bool isSearching=false;

  @override
  _DialogFilterState createState() => _DialogFilterState();
}

class _DialogFilterState extends State<DialogFilter> {
  DateTime pickedDate;
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

  @override
  void initState() {
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(DialogFilter.isSearching){
      getRefresh();
    }
    return StatefulBuilder(builder: (context, setStat) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(

          child: AlertDialog(

            insetPadding: EdgeInsets.symmetric(vertical: 250, horizontal: 25),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            title: Center(child: Text('البحث')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SwitchListTile(
                    activeColor: Colors.deepOrange,
                      title: Text('تفعيل الفلترة'),
                    onChanged: (value){
                       setState(() {
                         DialogFilter.isSearching=value;
                         if (value){
                           DialogFilter.traget=[stringToNumWilaya(DialogFilter.traget)];
                           DialogFilter.date = pickedDate;
                         }
                       });
                       getRefresh();
                    },
                    value: DialogFilter.isSearching,
                  ),
                  Filter(
                    dropTitle: 'الإنطلاق',
                    dropdownmenu: kWilayat,
                  ),
                  Filter(
                    dropTitle: 'الـوصـول',
                    dropdownmenu: kWilayat,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Filter(
                    dropTitle: 'المركبة',
                    dropdownmenu: vehicles,
                  ),
                  SizedBox(height: 20),
                  //GestureDetector(
                   // onTap: _pickDate,
                   // child: Text(
                   //     "يوم الانطلاق: ${pickedDate.year}/ ${pickedDate.month}/ ${pickedDate.day}"),
                  //),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text("بحث"),
                    onPressed: () {
                      getRefresh();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
