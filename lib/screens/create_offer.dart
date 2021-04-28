/*
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class TrajetBox extends StatefulWidget {
  @override
  _TrajetBoxState createState() => _TrajetBoxState();
}

class _TrajetBoxState extends State<TrajetBox> {
  List<String> _items = [null];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < 58; i++) {
      items.add(DropdownMenuItem(
        value: kWilaya[i],
        child: Text((i + 1).toString() + " - " + kWilaya[i]),
      ));
    }
    return items;
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: ReorderableListView(
          padding: EdgeInsets.symmetric(horizontal: 50),
          //
          children: <Widget>[
            for (int index = 0; index < _items.length; index++)
              ListTile(
                key: Key('$index'),
                title: DropdownButton(
                  key: Key('$index'),
                  hint: (index == 0) ? Text("الانطلاق") : Icon(Icons.add),
                  iconSize: 0,
                  value: _items[index],
                  items: _dropDownMenuItems,
                  onChanged: (String newValue) {
                    setState(() {
                      _items[index] = newValue;
                      if (_items.indexOf(null) == -1)
                        _items.insert(_items.length, null);
                    });
                  },
                ),
              ),
          ],
          //
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final String item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/wilaya-widget.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class TrajetBox extends StatefulWidget {
  @override
  _TrajetBoxState createState() => _TrajetBoxState();
}

class _TrajetBoxState extends State<TrajetBox> {
  List<String> _reaget = [null];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ReorderableListView(
          children: [
            for (int index = 0; index < _reaget.length; index++)
              WilayaWidget(
                key: Key("$index"),
                wilayat: kWilaya,
                wilaya: _reaget[index],
                onDeletIconPressed: () {
                  setState(() {
                    _reaget.removeAt(index);
                  });
                },
                onChooseWilaya: (_) {
                  if(! _reaget.contains(_)){
                    _reaget[index] = _;
                    if (_reaget.indexOf(null) == -1)
                      _reaget.insert(_reaget.length, null);

                    setState(() {});
                    print(_reaget);
                  }

                },
              ),
          ],
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              print(_reaget);
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final String item = _reaget.removeAt(oldIndex);
              _reaget.insert(newIndex, item);
              print(_reaget);

            });
          },
        ),
      ),
    );
  }
}
