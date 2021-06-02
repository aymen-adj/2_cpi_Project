import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

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

List<String> numToStringWilaya(String trajet) {
  List<String> temp = [];
  int i = 0;
  while (i < trajet.length - 1) {
    temp.add(kWilaya.elementAt(int.parse(trajet.substring(i, i + 2)) - 1));
    i = i + 2;
  }
  print(temp);
  return temp;
}

String stringToNumWilaya(List<String> trajet) {
  String temp = "";
  for (int i = 0; i < trajet.length; i++) {
    temp += '${kWilaya.indexOf(trajet[i]) + 1}';
  }
  return temp;
}

Future<void> getRefresh() async {
  await Future.delayed(Duration(seconds: 3));
}

Future<void> makePhoneCall(String url) async {
  url='tel:'+url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}