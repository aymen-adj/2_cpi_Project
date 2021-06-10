import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    if (kWilaya.indexOf(trajet[i]) < 9)
      temp = temp + '0' + (kWilayaNumerated.indexOf(trajet[i]) + 1).toString();
    else
      temp = temp + (kWilayaNumerated.indexOf(trajet[i]) + 1).toString();
  }
  print(temp);
  return temp;
}

Future<void> getRefresh() async {
  await Future.delayed(Duration(seconds: 3));
}

Future<void> makePhoneCall(String url) async {
  url = 'tel:' + url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

String getTheTypeOfVehicule(int type) {
  if (type == 0)
    return "شاحنة مبردة";
  else if (type == 1)
    return "شاحنة";
  else if (type == 2)
    return " سيارة";
  else
    return "دراجة";
}

int getNumOfVehicule(String vehicule) {
  if (vehicule == "شاحنة مبردة")
    return 0;
  else if (vehicule == "شاحنة")
    return 1;
  else if (vehicule == " سيارة")
    return 2;
  else
    return 3;
}

Future<User> getUserFromSharedPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return User(
    famillyName: prefs.getString("famillyName"),
    firstName: prefs.getString("firstName"),
    id: prefs.getInt("id"),
    phoneNumber: prefs.getString("phoneNumber"),
    rateAsClient: prefs.getDouble("rateAsClient"),
    rateAsDriver: prefs.getDouble("rateAsDriver"),
  );
}

Future<void> setUserInSharedPrefs(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("famillyName", thisUser.famillyName);
  prefs.setString("firstName", thisUser.firstName);
  prefs.setInt("id", thisUser.id);
  prefs.setString("phoneNumber", thisUser.phoneNumber);
  prefs.setDouble("rateAsClient", thisUser.rateAsClient);
  prefs.setDouble("rateAsDriver", thisUser.rateAsDriver);
  prefs.setBool('logIn', true);
}

Future<void> logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('logIn', false);
}
