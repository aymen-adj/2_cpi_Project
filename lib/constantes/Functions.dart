import 'package:flutter/material.dart';

String getPostingTime(){
  return '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}  ${DateTime.now().hour}:${DateTime.now().minute}';
}