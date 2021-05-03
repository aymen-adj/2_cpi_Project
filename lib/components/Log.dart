import 'package:flutter/material.dart';

class Bouton extends StatelessWidget {
  Bouton(
      {@required this.text,
      @required this.boutoncolor,
      @required this.textcolor,
      @required this.onpressed});
  final Color textcolor;
  final Color boutoncolor;
  final String text;
  final Function onpressed;€

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.06,
        // ignore: deprecated_member_use
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
  Formule({@required this.text, @required this.icon, this.pass});
  final String text;
  final IconData icon;
  final bool pass;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: TextFormField(
        decoration: InputDecoration(icon: Icon(icon), labelText: text),
        keyboardType: TextInputType.visiblePassword,
        obscureText: pass ?? false,
      ),
    );
  }
}
