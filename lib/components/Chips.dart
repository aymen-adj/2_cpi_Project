import 'package:flutter/material.dart';

Widget buildChip(String wilayaName, int step) {
  return Chip(
    //labelPadding: EdgeInsets.all(2.0),
    avatar: CircleAvatar(
      backgroundColor: Colors.white60,
      child: Text(
        '$step',
        style: TextStyle(color: Colors.black),
      ),
    ),
    label: Text(
      wilayaName,
      style: TextStyle(
          //  color: Colors.white,
          ),
    ),
  );
}

List<Widget> TransformStringToChip(List<String> listOfString) {
  List<Widget> traj = [];
  for (int i = 0; i < listOfString.length; i++) {
    traj.add(buildChip(listOfString[i], i + 1));
  }
  return traj;
}

Widget chipList(List children) {
  return Wrap(
    spacing: 6.0,
    runSpacing: 6.0,
    children: children,
  );
}
