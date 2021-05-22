import 'package:flutter/material.dart';

class PostClass {
  final userId;
  final postID;
  final postingDate;
  final Image image;
  final List trajet;
  final String vehicule;
  final String description;
  final bool postType;
  final String date;
  final String phoneNumber;
  final time;
  PostClass({
    @required this.userId,
    @required this.postID,
    this.description = '',
    this.image,
    this.date,
    this.time,
    @required this.postingDate,
    @required this.postType,
    this.trajet,
    this.phoneNumber,
    this.vehicule,
  });
}
