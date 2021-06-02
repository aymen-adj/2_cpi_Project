import 'package:flutter/material.dart';

class CreateDemande extends StatefulWidget {
  static const String id = "create demandes";
  @override
  _CreateDemandeState createState() => _CreateDemandeState();
}

class _CreateDemandeState extends State<CreateDemande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            TextFormField(
              maxLength: 20,
              decoration: InputDecoration(
                labelText: 'Label text',
                labelStyle: TextStyle(
                  color: Color(0xFF6200EE),
                ),
                helperText: 'Helper text',
                suffixIcon: Icon(
                  Icons.check_circle,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6200EE)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
