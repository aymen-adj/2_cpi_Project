import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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

  Widget _hint;

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
          padding: EdgeInsets.symmetric(horizontal: 40),
          //
          children: <Widget>[
            for (int index = 0; index < _items.length; index++)
              DropdownButton(
                key: Key('$index'),
                hint: (index == 0) ? Text("الانطلاق") : Icon(Icons.add),
                iconSize: 0,
                value: _items[index],
                items: _dropDownMenuItems,
                focusColor: Colors.blue,
                onChanged: (String newValue) {
                  setState(() {
                    _items[index] = newValue;
                  });
                },
              ),
            ElevatedButton(
              key: ValueKey(58),
              child: Text('Add'),
              onPressed: () {
                setState(() {
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
    );
  }
}
