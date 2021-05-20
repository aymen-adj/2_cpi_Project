import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Log.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  static bool validpass = true;
  static bool validphone = true;
  static bool valid = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Bar(pourcentage: 0.42),
            SizedBox(
              height: 20,
            ),
            Formule(
                text: 'الإسـم و اللقب',
                icon: Icons.account_circle,
                type: formtype.name),
            SizedBox(
              height: 20,
            ),
            Formule(
              text: 'رقم الهاتف',
              icon: Icons.phone,
              type: formtype.phone,
            ),
            SizedBox(
              height: 25,
            ),
            Formule(
              text: 'كلمة المرور',
              icon: Icons.vpn_key,
              type: formtype.pass,
            ),
            SizedBox(
              height: 25,
            ),
            Bouton(
                text: 'إنشاء حساب جديد',
                boutoncolor: Colors.blue,
                textcolor: Colors.white,
                onpressed: () {
                  print(valid);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('يرجى ملء المعلومات ب طريقة صحيحة'),
                            content: Text('dsqdksqj'),
                          ));
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => (Signup2())));
                }),
            SizedBox(
              height: 15,
            ),
            Text(
              '-----------------------أو-----------------------',
              style: TextStyle(fontSize: 20, color: Colors.black26),
            ),
            SizedBox(
              height: 15,
            ),
            Bouton(
                text: 'تسجيل الدخول',
                boutoncolor: Colors.white,
                textcolor: Colors.blue,
                onpressed: () {}),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      )),
    );
  }
}
