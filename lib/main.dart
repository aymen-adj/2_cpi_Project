import 'package:flutter/material.dart';
import 'constantes/constants.dart';
import 'package:ii_cpi_project/screens/profileScreen.dart';
import 'components/appbar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (contex) => Home(),
    },
  ));
}

const kMyColor = Colors.red;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;
  PageController index = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),   //   components/appbar.dart
      appBar: AppBar(

        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.home,
                  color: selected == 0 ? kMyColor : Colors.grey,
                ),
                iconSize: 36,
                onPressed: () {
                  setState(() {
                    selected = 0;
                    index.jumpToPage(0);
                  });
                }),
            IconButton(
                icon: Icon(
                  Icons.contacts_rounded,
                  color: selected == 1 ? kMyColor : Colors.grey,
                ),
                iconSize: 36,
                onPressed: () {
                  setState(() {
                    index.jumpToPage(1);
                    selected = 1;
                  });
                }),
            IconButton(
                icon: Icon(
                  Icons.schedule_send,
                  color: selected == 2 ? kMyColor : Colors.grey,
                ),
                iconSize: 36,
                onPressed: () {
                  setState(() {
                    index.jumpToPage(2);
                    selected = 2;
                  });
                }),
            IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: selected == 3 ? kMyColor : Colors.grey,
                ),
                iconSize: 36,
                onPressed: () {
                  setState(() {
                    index.jumpToPage(3);
                    selected = 3;
                  });
                }),
          ],
        ),
      ),
      body: PageView(
        onPageChanged: (ind) {
          setState(() {
            selected = ind;
          });
        },
        controller: index,
        children: [
          HomePage(),
          TrajetBox(),
          ProfileScreen(),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.teal,
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
