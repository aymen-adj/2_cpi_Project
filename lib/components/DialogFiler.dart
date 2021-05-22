import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/components/SearchFiler.dart';

class DialogFilter extends StatefulWidget {
  static List<String> traget = [null, null];
  static String vehicule;
  static DateTime date;

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
    return StatefulBuilder(builder: (context, setState) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(vertical: 250, horizontal: 25),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            title: Center(child: Text('البحث')),
            content: Column(
              children: [
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
                GestureDetector(
                  onTap: _pickDate,
                  child: Text(
                      "يوم الانطلاق: ${pickedDate.year}/ ${pickedDate.month}/ ${pickedDate.day}"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("بحث"),
                  onPressed: () {
                    print(DialogFilter.traget);
                    print(DialogFilter.vehicule);
                    DialogFilter.date = pickedDate;
                    print(DialogFilter.date);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
