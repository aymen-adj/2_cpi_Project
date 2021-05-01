import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Log.dart';
import 'package:ii_cpi_project/screens/Sign%20up.dart';
import 'package:ii_cpi_project/screens/log_in.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.lightBlueAccent, Colors.blue],
            )),
     child: Column(
        children: [
          Expanded(
              flex: 7, child: Image(image: AssetImage('images/logo.png'))),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  child: Text('خدمة التوصيل',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Amiri',
                        fontSize: 35,
                      )),
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text('نوفر لكم خدمة توصيل أسطورية و بلا بلا يلا',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white60,
                      )),
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Bouton(
                  text: 'تسجيل الدخول',
                  boutoncolor: Colors.white,
                  textcolor: Colors.blue,
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Bouton(
                  text: 'إنشاء حساب جديد',
                  boutoncolor: Colors.blue,
                  textcolor: Colors.white,
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sign()));
                  },
                ),
              ],
            ),
          )
        ],
      ),),
    );
  }
}
