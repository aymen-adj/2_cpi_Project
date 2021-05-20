import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

String getPostingTime() {
  return '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}  ${DateTime.now().hour}:${DateTime.now().minute}';
}

// ignore: non_constant_identifier_names
List<Widget> TransformStringToWidget(List<String> listOfString) {
  List<Widget> traj = [];
  for (int i = 0; i < listOfString.length; i++) {
    traj.add(Text(listOfString[i]));
  }
  return traj;
}

void gotoTopPage(ScrollController scrollController) {
  scrollController.animateTo(scrollController.initialScrollOffset,
      duration: Duration(milliseconds: 2000), curve: Curves.easeOut);
}

void createPostToDB(
    var postingDate, date, trajet, vehicule, description, postType) async {
  var settings = ConnectionSettings(
    host: '172.20.10.10',
    port: 3306,
    user: 'mosbah',
    password: 'mosbah',
    db: 'ftrigk',
  );
  var conn = await MySqlConnection.connect(settings);
  print(conn.toString());
  var r = await conn.query(
      "insert into Post (PostingDate,Date,Trajet,Vehicule,Description,PostType) values (?,?,?,?,?,?)",
      [postingDate, date, trajet, vehicule, description, postType]);
  print(r);
}
