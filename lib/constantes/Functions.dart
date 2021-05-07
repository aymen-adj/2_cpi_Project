import 'package:flutter/material.dart';

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
