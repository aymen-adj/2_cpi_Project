import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/Demandes.dart';
import 'package:ii_cpi_project/screens/create_offer.dart';
import 'package:ii_cpi_project/screens/homeScreen.dart';
import 'package:ii_cpi_project/screens/profileScreen.dart';

import 'components/appbar.dart';

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark(),
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
      drawer: MyDrawer(), //   components/appbar.dart
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
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
          DemandesScreen(),
          TrajetBox(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
