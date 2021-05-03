import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Chips.dart';
import 'package:ii_cpi_project/components/CustomContainer.dart';
import 'package:ii_cpi_project/screens/Profile.dart';

class Post extends StatefulWidget {
  final userId;
  final postID;
  final postingDate;
  final Image image;
  final List trajet;
  final String vehicule;
  final String description;
  final postType;
  final String date;
  final String phoneNumber;
  final time;
  Post({
    @required this.userId,
    @required this.postID,
    this.description,
    this.image,
    this.date,
    this.time,
    @required this.postingDate,
    @required this.postType,
    this.trajet,
    this.phoneNumber,
    this.vehicule,
  });
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final userName = 'Profile name';
  int maxlines = 2;
  bool trajetIsDetailed = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Expanded(
        child: Container(
          //height: 300,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  1.0,
                  0.9,
                ),
                blurRadius: 4.0,
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Image.asset('images/logo.png'),
                ),
                title: Text(userName),
                subtitle: Text(widget.postingDate == null
                    ? 'Just now'
                    : widget.postingDate.toString()),
                trailing: DropdownButton(
                  underline: Container(
                    width: 1,
                  ),
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
                      height: 150,
                      // width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomContainer(
                                text: widget.vehicule.toString(),
                                icon: Icons.train_rounded,
                                subtitle: 'نوع المركبة',
                              ),
                              CustomContainer(
                                icon: Icons.phone,
                                text: '0${widget.phoneNumber}',
                                subtitle: 'رقم الهاتف',
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomContainer(
                                icon: Icons.timer,
                                text: widget.time,
                                subtitle: 'الوقت',
                              ),
                              CustomContainer(
                                icon: Icons.timer,
                                text: widget.date,
                                subtitle: 'تاريخ الانطلاق',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            maxlines == 2 && TextOverflow.values != []
                                ? maxlines = 50
                                : maxlines = 2;
                          });
                        },
                        child: Text(
                          widget.description,
                          style: TextStyle(fontSize: 20),
                          textDirection: TextDirection.rtl,
                          maxLines: maxlines,
                          overflow: TextOverflow.values == []
                              ? null
                              : TextOverflow.ellipsis,
                          semanticsLabel: 'see more',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          trajetIsDetailed = !trajetIsDetailed;
                        });
                      },
                      child: trajetIsDetailed
                          ? DetailedTrajet(
                              trajet: widget.trajet,
                            )
                          : TrajetContainer(
                              trajet: widget.trajet,
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrajetContainer extends StatelessWidget {
  final List<String> trajet;

  TrajetContainer({this.trajet});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomContainer(
            subtitle: 'نقطة الإنطلاق',
            text: trajet[0],
            icon: Icons.location_on_outlined,
          ),
          Icon(
            Icons.arrow_right_alt,
            size: 40,
            textDirection: TextDirection.rtl,
          ),
          CustomContainer(
            subtitle: 'نقطة الوصول',
            text: trajet.last,
            icon: Icons.location_on_outlined,
          ),
        ],
      ),
    );
  }
}

class DetailedTrajet extends StatelessWidget {
  List<dynamic> trajet;
  DetailedTrajet({this.trajet});
  @override
  Widget build(BuildContext context) {
    List<Widget> traj = [];
    for (int i = 0; i < trajet.length; i++) {
      traj.add(buildChip(trajet[i], Colors.deepOrange));
    }
    return Container(
      margin: EdgeInsets.all(10),
      child: chipList(traj),
    );
  }
}
