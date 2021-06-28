import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  UserInfo({
    @required this.status,
    @required this.user_name,
    @required this.user_type,
  });

  final bool status; // true == "تم التوصيل"
  final String user_name;
  final bool user_type; // true == "موصل"

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user_type ? '$user_name (موصل)' : '$user_name (زبون)',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "حالة العملية: ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              status ? "تم التوصيل" : "جاري التوصيل",
              style: TextStyle(
                color: status ? Colors.green : Colors.red,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
