import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ii_cpi_project/components/BasicContainerWithShadow.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';

class HomeAppBar extends StatefulWidget {
  ScrollController scrollController;
  HomeAppBar({this.scrollController});
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String Wilaya;
  DateTime pickedDate;

  @override
  void initState() {
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SliverAppBar(
        centerTitle: false,
        expandedHeight: 60,
        title: Text(
          'طلبات التوصيل',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
          textDirection: TextDirection.ltr,
        ),
        floating: true,
        actions: [
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black26),
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return StatefulBuilder(builder: (context, setState) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: AlertDialog(
                              title: Center(child: Text('البحث')),
                              content: Column(
                                children: [
                                  Filter(
                                    DropTitle: 'الإنطلاق',
                                    dropdownmenu: kWilayat,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Filter(
                                    DropTitle: 'الـوصـول',
                                    dropdownmenu: kWilayat,
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Filter(
                                    DropTitle: 'المركبة',
                                    dropdownmenu: vehicles,
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  GestureDetector(
                                    onTap: _pickDate,
                                    child: BasicContainerWithShadow(
                                      child: Text(
                                          "يوم الانطلاق: ${pickedDate.year}, ${pickedDate.month}, ${pickedDate.day}"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      });
                }),
          ),
        ],
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
}

class Filter extends StatefulWidget {
  Filter({@required this.DropTitle, @required this.dropdownmenu});

  final String DropTitle;
  final List<DropdownMenuItem> dropdownmenu;
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String wilaya;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Text(widget.DropTitle,
                style: TextStyle(
                  fontFamily: 'Amiri',
                )),
          ),
        ),
        Expanded(
          flex: 2,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: wilaya,
              onChanged: (value) {
                setState(() {
                  wilaya = value;
                });
              },
              items: widget.dropdownmenu,
            ),
          ),
        ),
      ],
    );
  }
}
