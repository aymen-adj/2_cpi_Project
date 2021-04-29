import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Log.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Bar(
              pourcentage: 0.46,
            ),
            SizedBox(
              height: 15,
            ),
            Formule(text: 'البريد الإلكتروني', icon: Icons.email),
            SizedBox(
              height: 20,
            ),
            Formule(
              text: 'كلمة المرور',
              icon: Icons.vpn_key,
              pass: true,
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.bottomRight,
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Bouton(
              text: 'تسجيل الدخول',
              boutoncolor: Colors.blue,
              textcolor: Colors.white,
              onpressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '-----------------------أو-----------------------',
              style: TextStyle(fontSize: 20, color: Colors.black26),
            ),
            SizedBox(
              height: 20,
            ),
            Bouton(
              text: 'إنشاء حساب جديد',
              boutoncolor: Colors.white,
              textcolor: Colors.blue,
              onpressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
