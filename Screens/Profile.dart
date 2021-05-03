import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Circle.dart';
import 'package:ii_cpi_project/components/RatingNumber.dart';
import 'package:ii_cpi_project/components/RatingStars.dart';
import 'package:ii_cpi_project/components/TextBox.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF9302F1),

          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 35.0,
                ),
                onPressed: () {
                  print('lpa');
                }),
          ],
          brightness: Brightness.light,
          //backgroundColor: Colors.amber,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            "Profile Screen",
          ),
          centerTitle: false,

          leading: Icon(Icons.menu),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Positioned(
                    child: Circle(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFB120C0),
                          blurRadius: 50.0,
                        ),
                      ],
                      width: 480.0,
                      height: 600.0,
                      color2: Color(0xFF7105DC),
                      color1: Color(0xFFB120C0),
                    ),
                    right: 10,
                    bottom: -10,
                  ),
                  Positioned(
                    child: Circle(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF7105DC),
                          blurRadius: 30.0,
                        ),
                      ],
                      color2: Color(0xFF9302F1),
                      color1: Color(0xFFFA04B1),
                      width: 475.0,
                      height: 600.0,
                    ),
                    right: -125,
                    bottom: -30,
                  ),
                  Positioned(
                    child: Circle(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF7105DC),
                          blurRadius: 30.0,
                        ),
                      ],
                      color2: Color(0xFF9302F1),
                      color1: Color(0xFFFA04B1),
                      width: 475.0,
                      height: 600.0,
                    ),
                    right: -125,
                    bottom: -20,
                  ),
                  Positioned(
                    child: Circle(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[600],
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      color1: Theme.of(context).scaffoldBackgroundColor,
                      color2: Theme.of(context).scaffoldBackgroundColor,
                      width: 460.0,
                      height: 460.0,
                    ),
                    bottom: 95,
                    right: -50,
                  ),
                  Positioned(
                    child: Circle(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[600],
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      color1: Theme.of(context).scaffoldBackgroundColor,
                      color2: Theme.of(context).scaffoldBackgroundColor,
                      width: 460.0,
                      height: 460.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            alignment: AlignmentGeometry.lerp(
                                Alignment.center, Alignment.center, 0.1),
                            children: [
                              Circle(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 50.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                height: 110.0,
                                width: 110.0,
                                color1:
                                    Theme.of(context).scaffoldBackgroundColor,
                                color2:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('lib/assets/avatar.jpg'),
                                backgroundColor: Colors.blue,
                                radius: 50.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Cinex',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                            ),
                          ),
                          Text(
                            'Oran - 44',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0,
                                color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                    bottom: 108,
                    right: -50,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBox(
                            color: Color(0xFF9302F1),
                            label: 'Bio',
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                              'Voici  hfdkfldsyeriuzyeiurhsjkrhdsskuzeyiruzheidrtu buuiquelques conseils : Vérifiez les câbles réseau, Voici quelques conseils : Vérifiez les câbles réseau '),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Divider(
                            height: 10.0,
                            thickness: 2.0,
                          ),
                          RatingStars(
                            label: 'Rating As Driver',
                            rate: 4,
                          ),
                          RatingStars(
                            label: 'Rating As Client',
                            rate: 2,
                          ),
                          RatingNumber(
                            label: 'Succesful delivries',
                            num: 55,
                          ),
                          RatingNumber(
                            label: 'Total distance (km)',
                            num: 2547,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
