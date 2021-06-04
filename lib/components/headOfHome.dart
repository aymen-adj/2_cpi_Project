import 'package:flutter/material.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';

import '../constantes/Colors.dart';

class Category {
  String name;
  IconData icon;
  bool isSelected = false;
  void Function() onTap;
  Category({this.icon, this.name, this.isSelected, this.onTap});
}

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 70.0,
        //centerTitle: true,
        backgroundColor: Color(0xFFf2f2f4),
        leading: IconButton(
          icon: Icon(
          Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Icon(
              Icons.local_activity_rounded,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Bechar',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.grey[500],
              ),
            )
          ],
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(
              right: 10.0,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 20.0,
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFf2f2f4),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(
                15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Mosbah',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Where do you\nwanna go?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        )),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Where do you wanna go?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 75.0,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: categories[i].onTap,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            categories[i].icon,
                            color: (categories[i].isSelected)
                                ? Colors.white
                                : kColorBlue,
                          ),
                          Text(
                            categories[i].name,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: (i == 0) ? Colors.white : kColorBlue,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: (categories[i].isSelected)
                            ? kColorBlue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          20.0,
                        ),
                        border: Border.all(
                          color: (categories[i].isSelected)
                              ? Colors.transparent
                              : kColorBlue,
                          width: 3.0,
                        ),
                      ),
                      margin: EdgeInsets.all(10.0),
                      width: 110.0,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                top: 20.0,
              ),
              child: Text(
                'Top Destinations',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              height: 240.0,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(
                  20.0,
                ),
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.all(
                      5.0,
                    ),
                    width: 200.0,
                    padding: EdgeInsets.all(
                      7.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          child: Image.asset('images/oran.jpg'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Oran',
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              size: 25.0,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        margin: EdgeInsets.all(
          10.0,
        ),
        padding: EdgeInsets.all(
          10.0,
        ),
        decoration: BoxDecoration(
          color: kColorBlue,
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.ac_unit,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.verified_user,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf2f2f4),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(
              15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Mosbah',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Where do you\nwanna go?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      )),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Where do you wanna go?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 75.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, i) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.train,
                        color: (categories[i].isSelected) ? Colors.white : kColorBlue,
                      ),
                      Text(
                        'Car',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: (categories[i].isSelected) ? Colors.white : kColorBlue,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: (categories[i].isSelected) ? kColorBlue : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    border: Border.all(
                      color: (categories[i].isSelected) ? Colors.transparent : kColorBlue,
                      width: 3.0,
                    ),
                  ),
                  margin: EdgeInsets.all(10.0),
                  width: 110.0,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              top: 20.0,
            ),
            child: Text(
              'Top Destinations',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            height: 240.0,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(
                20.0,
              ),
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.all(
                    5.0,
                  ),
                  width: 200.0,
                  padding: EdgeInsets.all(
                    7.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        child: Image.asset('images/avatar.jpg',),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Oran',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 25.0,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}