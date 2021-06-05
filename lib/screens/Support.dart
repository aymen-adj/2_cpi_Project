import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("الدعم"),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "البريد الالكترىوني",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('images/mail.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'ftrigk.esi@gmail.com',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "الهاتف",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('images/phone.png'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  'ftrigk.esi@gmail.com',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
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
