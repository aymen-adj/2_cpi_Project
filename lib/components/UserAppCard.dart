import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/UserAppInfo.dart';

class UserAppCard extends StatelessWidget {
  UserAppCard({
    @required this.status,
    @required this.user_name,
    @required this.user_type,
  });

  final bool status; // true == "تم التوصيل"
  final String user_name;
  final bool user_type; // true == "موصل"

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: UserInfo(
                user_type: this.user_type,
                user_name: this.user_name,
                status: this.status,
              ),
            ),
            status
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        child: Text(
                          user_type ? "تم الاستلام" : 'تم التوصيل',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8),
                      TextButton(
                        child: Text(
                          'تم الغاء العملية',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
