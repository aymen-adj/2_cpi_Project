import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/profileScreen.dart';

class Post extends StatefulWidget {
  final userId;
  final postID;
  final postingDate;
  final image;
  final trajet;
  final vehicule;
  final description;
  final postType;
  Post(
      {this.userId,
      this.postID,
      this.description,
      this.image,
      this.postingDate,
      this.postType,
      this.trajet,
      this.vehicule});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final userName='Profile name';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              1.0,
              2.9,
            ),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('images/logo.png'),
            ),
            title: Text(userName),
            subtitle: Text(widget.postingDate.toString()),
            trailing: DropdownButton(
              icon: Icon(Icons.more_horiz_rounded),
              dropdownColor: Colors.blueGrey,
              items: <String>['Save Post', 'Report Post', 'Notify Me']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>( // to transform list<string> to DropDownMenuItem
                  value: value,// the string
                  child: Text(value),
                );
              }).toList(),
              onChanged: (f) {
                print(f);
              },
            ),
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, ProfileScreen.id); // go to profile taped in
              });
            },
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      VehiculeContainer(
                        vehiculName: widget.vehicule,
                      ),
                      VehiculeContainer(
                        vehiculName: 'Ferrari',
                      ),
                      VehiculeContainer(
                        vehiculName: 'R4',
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  child: Text(widget.description),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VehiculeContainer extends StatelessWidget {
  final String vehiculName;
  VehiculeContainer({this.vehiculName});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          Icon(
            Icons.train_rounded,
            size: 20,
          ),
          Text(vehiculName == null ? 'NONE' : vehiculName),// if no vehicule selected then print 'NONE'
        ],
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(9), boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: const Offset(
            1.0,
            2.9,
          ),
          blurRadius: 10.0,
          spreadRadius: 0.0,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ), //BoxShadow
      ]),
    );
  }
}
