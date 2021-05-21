import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Log.dart';
import 'package:mysql1/mysql1.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
  static String id = "sign";
}

class _SignState extends State<Sign> {
  static bool validpass = true;
  static bool validphone = true;
  static bool valid = true;
  String number = "";
  String nom = "";
  String pass = "";
  FirebaseAuth auth = FirebaseAuth.instance;
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
                type: formtype.name,
                valide: (b) {
                  valid = b;
                },
                valeur: (value) {
                  nom = value;
                }),
            SizedBox(
              height: 20,
            ),
            Formule(
                text: 'رقم الهاتف',
                icon: Icons.phone,
                type: formtype.phone,
                valide: (b) {
                  validphone = b;
                  print("executed" + valid.toString());
                },
                valeur: (value) {
                  number = value;
                }),
            SizedBox(
              height: 25,
            ),
            Formule(
                text: 'كلمة المرور',
                icon: Icons.vpn_key,
                type: formtype.pass,
                valide: (b) {
                  validpass = b;
                },
                valeur: (value) {
                  pass = value;
                }),
            SizedBox(
              height: 25,
            ),
            Bouton(
                text: 'إنشاء حساب جديد',
                boutoncolor: Colors.blue,
                textcolor: Colors.white,
                onpressed: () async {
                  if (!(valid && validpass && validphone))
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Center(child: Text("إنتـبه")),
                        content: Directionality(
                          child: Text('يرجى مراجعة المعلومات المدخلة'),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    );
                  else {
                    createuser();
                    await auth.verifyPhoneNumber(
                        phoneNumber: '+213' + number.substring(1),
                        timeout: Duration(seconds: 60),
                        verificationCompleted: (value) async {
                          print('C bon');
                        },
                        verificationFailed: (value) async {
                          print('mazal');
                        },
                        codeSent: (id, val) {
                          print(val);
                        },
                        codeAutoRetrievalTimeout: (value) async {
                          await print(value);
                        });
                  }
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

  void createuser() async {
    var settings = ConnectionSettings(
      host: '172.20.10.10',
      port: 3306,
      user: 'mosbah',
      password: 'mosbah',
      db: 'ftrigk',
    );
    var conn = await MySqlConnection.connect(settings);
    await conn.query(
        "insert into user (FirstName,PhoneNumber) values (?,?)", [nom, number]);
  }
}
