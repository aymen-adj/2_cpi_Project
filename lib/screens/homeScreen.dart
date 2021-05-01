import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/post.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Post(
              postID: 20,
              postingDate: '22/12/2020',
              postType: 0,
              userId: 244,
              vehicule: Vehicules.DACIA,
              trajet: '1958',
              date: '22/10/2020',
              phoneNumber: 0540047893,
              description:
                  'jfjfjjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxfjxxxxxxxxxxccccdffxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxjfjfjfjxxxxxxxxxxccccdffxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
            ),
          ],
        ),
      ),
    );
  }
}
