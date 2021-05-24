import 'package:flutter/material.dart';

enum formtype { pass, name, phone }

class valid {
  bool valide = true;
}

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

class Formule extends StatefulWidget {
  final void Function(bool b) valide;
  final void Function(String value) valeur;
  Formule(
      {@required this.text,
      @required this.icon,
      @required this.type,
      this.valide,
      this.valeur});
  final String text;
  final IconData icon;
  final formtype type;
  Color color = Colors.red;

  @override
  _FormuleState createState() => _FormuleState();
}

class _FormuleState extends State<Formule> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "دخل النيميرو مون فرار",
            icon: Icon(
              widget.icon,
              color: widget.color,
            ),
            labelText: widget.text),
        keyboardType: (widget.type == formtype.phone)
            ? TextInputType.phone
            : TextInputType.text,
        obscureText: (widget.type == formtype.pass) ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String value) {
          bool b = true;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              widget.color = Colors.blue;
            });
          });
          if (widget.type == formtype.pass) {
            if (value.length < 1) {
              b = false;
              widget.valide(b);
              return 'يرجى إدخال كلمة مرور أكثر أمان';
            }
          } else if (widget.type == formtype.phone) {
            if (!validnumber(value) && value.length != 0) {
              b = false;
              widget.valide(b);
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                setState(() {
                  widget.color = Colors.red;
                });
              });
              print("given M " + b.toString());

              return 'يرجى إدخال رقم صحيح';
            }
          } else {
            if (value.length == 0) {
              b = false;
              widget.valide(b);
              return 'يرجى كتابة إسم صحيح';
            }
          }
          widget.valide(b);
          return null;
        },
      ),
    );
  }
}

bool validnumber(String value) {
  return RegExp(r'^(?:[0]9)?[0-9]{10}$').hasMatch(value);
}
