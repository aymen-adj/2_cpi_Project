import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/appbar.dart';

class Filter extends StatefulWidget {
  Filter({@required this.dropTitle, @required this.dropdownmenu});

  final String dropTitle;
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
            child: Text(widget.dropTitle,
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
                if (widget.dropTitle == "الإنطلاق")
                  HomeAppBar.traget[0] = wilaya;
                else if (widget.dropTitle == "الـوصـول")
                  HomeAppBar.traget[1] = wilaya;
                else
                  HomeAppBar.vehicule = wilaya;
              },
              items: widget.dropdownmenu,
            ),
          ),
        ),
      ],
    );
  }
}
