import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';

class NotificationWidget extends StatelessWidget {
  NotificationClass noti;
  NotificationWidget({this.noti});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 160,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(right: 7, top: 10, left: 7),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                      child: Text(
                        noti.username.substring(0, 1),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    noti.username,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Amiri',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                noti.username + " " + noti.msg,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    minSize: 5,
                    child: Text(
                      'رفض',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {},
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CupertinoButton(
                    minSize: 10,
                    child: Text('قبول',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    onPressed: () {},
                    color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
