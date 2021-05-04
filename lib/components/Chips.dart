import 'package:flutter/material.dart';

Widget buildChip(String wilayaName, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
    avatar: CircleAvatar(
      backgroundColor: Colors.white70,
      child: Text(wilayaName[0].toUpperCase()),
    ),
    label: Text(
      wilayaName,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(8.0),
  );
}

List<Widget> TransformStringToChip(List<String> listOfString) {
  List<Widget> traj = [];
  for (int i = 0; i < listOfString.length; i++) {
    traj.add(buildChip(listOfString[i], Colors.deepOrange));
  }
  return traj;
}

chipList(List children) {
  return Wrap(
    spacing: 6.0,
    runSpacing: 6.0,
    children: children,
  );
}
