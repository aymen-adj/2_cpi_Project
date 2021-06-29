import 'package:flutter/material.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';

class Notifications extends StatefulWidget {
  // Notifications({this.notifications});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await getRefresh();
          setState(() {});
        },
        backgroundColor: Colors.white,
        color: Colors.blue,
        child: StreamBuilder(
            stream: importNotifications(ownerid: thisUser.id),
            builder: (context, snapshot) {
              List body = [];
              if (snapshot.hasData) {
                for (int k = 0; k < snapshot.data.length; k++) {
                  body.add(snapshot.data[snapshot.data.length - k - 1]);
                }
              }
              return (snapshot.hasError ||
                      !snapshot.hasData ||
                      snapshot.data == null)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: body.length,
                      itemBuilder: (context, i) {
                        return body[i]; // snapshot.data[i];
                      },
                    );
            }),
      ),
    );
  }
}
