import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/profileScreen.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class Post extends StatefulWidget {
  final userId;
  final postID;
  final postingDate;
  final Image image;
  final trajet;
  final Vehicules vehicule;
  final description;
  final postType;
  final date;
  final phoneNumber;
  Post(
      {@required this.userId,
      @required this.postID,
      this.description,
      this.image,
        this.date,
      @required this.postingDate,
      @required this.postType,
      this.trajet,
        this.phoneNumber,
      this.vehicule});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final userName = 'Profile name';
  int maxlines=2;
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
            subtitle: Text(widget.postingDate==null ? 'Just now' :widget.postingDate.toString()),
            trailing: DropdownButton(
              icon: Icon(Icons.more_horiz_rounded),
              dropdownColor: Colors.blueGrey,
              items: <String>['Save Post', 'Report Post', 'Notify Me']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  // to transform list<string> to DropDownMenuItem
                  value: value, // the string
                  child: Text(value),
                );
              }).toList(),
              onChanged: (f) {
                print(f);
              },
            ),
            onTap: () {
              setState(() {
                Navigator.pushNamed(
                    context, ProfileScreen.id); // go to profile taped in
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
                      MyOwnContainer(
                        text: widget.vehicule,
                        icon:Icons.train_rounded,
                      ),
                      MyOwnContainer(
                        icon: Icons.timer,
                        text: widget.date,
                      ),
                      MyOwnContainer(
                        icon: Icons.phone,
                        text: widget.phoneNumber,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        maxlines == 2 && TextOverflow.values != []  ? maxlines = 20 : maxlines = 2;
                      });
                    },
                    child: Text(widget.description,textDirection: TextDirection.rtl,
                    maxLines: maxlines,
                    overflow: TextOverflow.values== [] ? null : TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyOwnContainer extends StatelessWidget {
  final text;
  final icon;
MyOwnContainer({this.text,this.icon});
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
            icon,
            size: 20,
          ),
          Text(text == null
              ? 'NONE'
              : text.toString().contains('Vehicules.' ) ? text.toString().substring(10) : text.toString() ), // if no vehicule selected then print 'NONE'
          //substring to delete the string = 'Vehicules.'

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
