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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image(image: AssetImage('images/logo.png')),
            height: MediaQuery.of(context).size.height * 0.48,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.lightBlueAccent, Colors.blue],
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Formule(text: 'البريد الإلكتروني', icon: Icons.email),
          SizedBox(
            height: 20,
          ),
          Formule(text: 'كلمة المرور', icon: Icons.vpn_key),
          SizedBox(
            height: 50,
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
    );
  }
}

class Formule extends StatelessWidget {
  Formule({@required this.text, @required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: TextFormField(
        decoration: InputDecoration(icon: Icon(icon), labelText: text),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }
}
