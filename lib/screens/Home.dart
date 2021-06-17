/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Drawer.dart';
import 'package:ii_cpi_project/constantes/Colors.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/screens/Profile.dart';

import 'Demandes.dart';
import 'Offers.dart';

class Home extends StatefulWidget {
  static PageController index = PageController(initialPage: 0);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;
  PageController index;
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    index = Home.index;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(), //   components/appbar.dart
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: selected == 0 ? ActiveColor : Colors.grey,
                  ),
                  iconSize: 36,
                  onPressed: () {
                    setState(() {
                      gotoTopPage(scrollController);
                      selected = 0;
                      index.jumpToPage(0);
                    });
                  }),
              IconButton(
                  icon: Icon(
                    Icons.contacts_rounded,
                    color: selected == 1 ? ActiveColor : Colors.grey,
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
                    Icons.account_circle,
                    color: selected == 2 ? ActiveColor : Colors.grey,
                  ),
                  iconSize: 36,
                  onPressed: () {
                    setState(() {
                      index.jumpToPage(2);
                      selected = 2;
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
            Offers(
              scrollController: scrollController,
            ),
            DemandesScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/DialogFilter.dart';
import 'package:ii_cpi_project/components/Drawer.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/screens/Demandes.dart';
import 'package:ii_cpi_project/screens/Offers.dart';
import 'package:ii_cpi_project/screens/Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> pages = [];
  String title = 'عروض التوصيل';
  @override
  void initState() {
    pages.add(Offers());
    pages.add(Demandes());
    pages.add(ProfileScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme; /**/
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: GestureDetector(
            onTap: (){
              gotoTopPage(Offers.scrollController);
            },
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
          actions: [
            Container(
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return DialogFilter();
                        });
                  }),
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.onSurface,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,

          onTap: (value) {
            setState(() {
              _currentIndex = value;
              switch (_currentIndex) {
                case 0:
                  {
                    title = 'عروض التوصيل';
                  }
                  break;
                case 1:
                  {
                    title = 'طلبات التوصيل';
                  }
                  break;
                case 1:
                  {
                    title = 'حسابي الشخصي';
                  }
                  break;
              }
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts_rounded,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
