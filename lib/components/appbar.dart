import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class HomeAppBar extends StatefulWidget {
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isSearching=false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SliverAppBar(
        centerTitle: false,
        expandedHeight: 60,
        title:isSearching? TextField(

        ): Text('طلبات التوصيل',
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
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black26
            ),
            child: IconButton(icon: Icon(isSearching? Icons.cancel : Icons.search,size: 30,), onPressed: (){
              setState(() {
                isSearching=!isSearching;
              });
            }),
          )
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  minRadius: 30,
                  maxRadius: 50,
                ),
                Text('mosbah'),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
