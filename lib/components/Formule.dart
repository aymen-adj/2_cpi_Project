import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Formule extends StatefulWidget {
  final String Function(String value) validator;
  final String hint;
  final int maxLength;
  Formule(
      {@required this.text,
      this.icon,
      this.hint,
      this.color,
      this.keyboardtype,
      this.pass,
      this.maxLength,
      this.validator});
  final String text;
  final IconData icon;
  final Color color;
  final TextInputType keyboardtype;
  final bool pass;
  @override
  _FormuleState createState() => _FormuleState();
}

class _FormuleState extends State<Formule> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: TextFormField(
        maxLength: widget.maxLength,
        cursorColor: widget.color,
        autofocus: true,
        decoration: InputDecoration(
          hintText: widget.hint,
          icon: Icon(
            widget.icon,
            color: widget.color,
          ),
          labelStyle: TextStyle(
            color: widget.color,
          ),
          labelText: widget.text,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.color),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.color),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.color),
          ),
        ),
        keyboardType: widget.keyboardtype,
        obscureText: widget.pass ?? false,
        autovalidateMode: AutovalidateMode.always,
        validator: widget.validator,
      ),
    );
  }
}

bool ValidNumber(String Number) {
  return RegExp(r'^0[5-7][0-9]{8}$').hasMatch(Number);
}
