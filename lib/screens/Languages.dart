import 'package:flutter/material.dart';

class Languages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("تغيير اللغة"),
        ),
        body: Container(
          child: Column(
            children: [
              ListTile(
                title: Text("العربية"),
                onTap: () {},
              ),
              SizedBox(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                title: Text("الانجليزية"),
                onTap: () {},
              ),
              SizedBox(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                title: Text("الفرنسية"),
                onTap: () {},
              ),
              SizedBox(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
