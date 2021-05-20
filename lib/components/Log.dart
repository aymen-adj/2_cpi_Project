import 'package:flutter/material.dart';

enum formtype { pass, name, phone }

class Bouton extends StatelessWidget {
  Bouton(
      {@required this.text,
      @required this.boutoncolor,
      @required this.textcolor,
      @required this.onpressed});
  final Color textcolor;
  final Color boutoncolor;
  final String text;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
          ),
        ),
        color: boutoncolor,
        onPressed: onpressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  Bar({@required this.pourcentage});
  final double pourcentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image(image: AssetImage('images/logo.png')),
      height: MediaQuery.of(context).size.height * pourcentage,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.lightBlueAccent, Colors.blue],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
      ),
    );
  }
}

class Formule extends StatelessWidget {
  Formule(
      {@required this.text,
      @required this.icon,
      @required this.type,
      bool valid});
  final String text;
  final IconData icon;
  final formtype type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: TextFormField(
        decoration: InputDecoration(icon: Icon(icon), labelText: text),
        keyboardType:
            (type == formtype.phone) ? TextInputType.phone : TextInputType.text,
        obscureText: (type == formtype.pass) ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String value) {
          if (type == formtype.pass) {
            if (value.length < 8) {
              return 'يرجى إدخال كلمة مرور أكثر أمان';
            }
          } else if (type == formtype.phone) {
            if (!validnumber(value)) {
              return 'يرجى إدخال رقم صحيح';
            }
          } else {
            if (value.length == 0) {
              return 'يرجى كتابة إسم صحيح';
            }
          }
        },
      ),
    );
  }
}

bool validnumber(String value) {
  return RegExp(r'^(?:[0]9)?[0-9]{10}$').hasMatch(value);
}
