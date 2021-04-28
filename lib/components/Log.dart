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
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
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
      ),
    );
  }
}
