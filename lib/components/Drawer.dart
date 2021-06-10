import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/screens/LogInUsingPhone.dart';
import 'package:ii_cpi_project/screens/MyDemands.dart';
import 'package:ii_cpi_project/screens/MyOffers.dart';
import 'package:ii_cpi_project/screens/Profile_settings.dart';

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
            Center(
                child: DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    child:  thisUser.firstName==null?null:Text(thisUser.firstName.substring(0,2).toUpperCase(),style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),
                    backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    backgroundImage: thisUser.firstName==null? AssetImage('images/emoji2.png'):null,
                    radius: 50,
                  ),
                  Text(
                    thisUser.firstName==null ?"user name" : thisUser.firstName,
                    style: TextStyle(
                        fontFamily: 'Amiri', fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
            DrawerItem(
              title: 'Find My Location',
              icon: Icons.location_on_outlined,
            ),
            DrawerItem(
              title: 'طلباتي',
              icon: Icons.description,
              idOfPage:MyDemands.id ,
            ),
            DrawerItem(
              title: 'عروضي',
              icon: Icons.local_offer,
              idOfPage: MyOffers.id,
            ),
            DrawerItem(
              title: 'الاعدادات',
              icon: Icons.settings,
            ),
            DrawerItem(
              title: 'تسجيل الخروج',
              icon: Icons.logout,
              idOfPage: LogInUsingPhone.id,
            ),
            DrawerHeader(
              child: Image.asset('images/logo.png'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(500, 150),
              )),
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
