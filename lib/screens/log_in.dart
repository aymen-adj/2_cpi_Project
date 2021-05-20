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
    var Taille = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Bar(
              pourcentage: 0.45,
            ),
            SizedBox(
              height: Taille.height * 0.02,
            ),
            Formule(
              text: 'رقم الهاتف',
              icon: Icons.phone,
              type: formtype.phone,
            ),
            SizedBox(
              height: Taille.height * 0.026,
            ),
            Formule(
              text: 'كلمة المرور',
              icon: Icons.vpn_key,
              type: formtype.pass,
            ),
            TextButton(
              child: Container(
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
              onPressed: () {},
            ),
            SizedBox(
              height: Taille.height * 0.052,
            ),
            Bouton(
              text: 'تسجيل الدخول',
              boutoncolor: Colors.blue,
              textcolor: Colors.white,
              onpressed: () {},
            ),
            SizedBox(
              height: Taille.height * 0.026,
            ),
            Text(
              '-----------------------أو-----------------------',
              style: TextStyle(fontSize: 20, color: Colors.black26),
            ),
            SizedBox(
              height: Taille.height * 0.026,
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
