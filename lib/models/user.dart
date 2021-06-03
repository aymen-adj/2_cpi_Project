

import 'package:flutter/material.dart';

class User{
  final int id;
  String firstName;
  String famillyName;
  String phoneNumber;
  double rateAsClient,rateAsDriver;

  User({this.phoneNumber,this.firstName,this.rateAsClient,this.rateAsDriver,this.famillyName,this.id});
}