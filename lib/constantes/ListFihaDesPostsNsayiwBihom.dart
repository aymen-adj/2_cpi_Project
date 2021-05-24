import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Post.dart';
import 'package:ii_cpi_project/components/wilayaImage.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/models/postClass.dart';

PostClass firstPostClass = PostClass(
  postID: 20,
  // postingDate: duration.inHours,
  postType: demande,
  userId: 244,
  vehicule: 'herbine',
  trajet: kWilaya.sublist(4, 14),
  date: '22/10/2020',
  time: '13:30',
  phoneNumber: '0540047893',
  description: 'السلام عليكم \n'
      'راني رايح من الجلفة لسطيف بصح ندخل لجيجل قبل. لي محتاج اي حاجة يعيطلي في التيليفون , رقم الهاتف راه واضح عندكم صحاب التطبيق هذا سهلولكم كلش ',
);

DateTime doka = DateTime.now();

DateTime kbel = DateTime.parse('2021-05-21');

Duration duration = doka.difference(kbel);

List<Widget> Posts = [
  WilayatImages(),
  Post(
    post: firstPostClass,
  ),
].toSet().toList();
