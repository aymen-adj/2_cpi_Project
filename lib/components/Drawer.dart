import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/cool-background.png'),
        )),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('images/logo.png'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(500, 150),
              )),
            ),
            DrawerItem(
              title: 'Find My Location',
              icon: Icons.location_on_outlined,
            ),
            DrawerItem(
              title: 'My Demands',
              icon: Icons.description,
            ),
            DrawerItem(
              title: 'My Offers',
              icon: Icons.local_offer,
            ),
            DrawerItem(
              title: 'Settings',
              icon: Icons.settings,
            ),
            DrawerItem(
              title: 'Help',
              icon: Icons.help_outline_rounded,
            ),
            Center(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text(
                  'Mosbah Aymen',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Amiri',
                      fontWeight: FontWeight.bold),
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/avatar.jpg')),
                accountEmail: Text(
                  'mosbah.avion12345@gmail.com',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Amiri',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  String idOfPage;
  DrawerItem({Key key, this.title, this.icon, this.idOfPage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //: EdgeInsets.symmetric(horizontal: 20),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontFamily: 'Amiri', fontWeight: FontWeight.bold),
      ),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      onTap: () {
        Navigator.pushNamed(context, idOfPage);
      },
      subtitle: Container(
        height: 1,
        color: Colors.black,
      ),
    );
  }
}
