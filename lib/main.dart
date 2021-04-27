import 'package:flutter/material.dart';
import 'constantes/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(

          body: Center(
            child: TrajetBox(),
          ),
        ),
      ),
    );
  }
}

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
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView(
                padding: EdgeInsets.symmetric(horizontal: 50),
                //
                children: <Widget>[
                  for (int index = 0; index < _items.length; index++)
                    DropdownButton(
                      key: Key('$index'),
                      hint: (index == 0) ? Text("الانطلاق") : Icon(Icons.add),
                      iconSize: 0,
                      value: _items[index],
                      items: _dropDownMenuItems,
                      onChanged: (String newValue) {
                        setState(() {
                          print(newValue);
                          _items[index] = newValue;
                          if (_items.indexOf(null) == -1)
                            _items.insert(_items.length, null);
                        });
                      },
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
          ],
        ),
      ),
    );
  }
}
