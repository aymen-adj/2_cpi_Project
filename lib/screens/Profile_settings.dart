import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Formule.dart';
import 'package:ii_cpi_project/screens/Languages.dart';
import 'package:ii_cpi_project/screens/Support.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  bool b = false;
  bool c = false;
  Color _color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: Icon(
                    Icons.tune,
                    color: Colors.black,
                    size: 36.0,
                  ),
                  title: Text(
                    'الاعدادات',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                    ),
                    child: Text(
                      'حفظ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/phpr.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Aouinane Moussa',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    //color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Formule(
                        // textDirection: TextDirection.rtl,
                        icon: Icons.account_circle,
                        hint: 'Aouinane Moussa',
                        text: "اسم المستخدم",

                        color: _color,
                      ),
                      Formule(
                        icon: Icons.phone,
                        hint: '0770228853',
                        text: "الهاتف",
                        color: _color,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/dark.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'الوضع المظلم',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Switch(
                    activeColor: Colors.black,
                    value: c,
                    onChanged: (value) {
                      setState(() {
                        c = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Languages()));
                    });
                  },
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/lang.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'اللغة',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/noti.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'الاشعارات',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Switch(
                    value: b,
                    onChanged: (value) {
                      setState(() {
                        b = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Support()));
                    });
                  },
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/supp.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'اتصل بالدعم',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {});
                  },
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/feed.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'ارسل رأيك',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {});
                  },
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'عن ftrigk',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
