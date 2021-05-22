import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Chips.dart';
import 'package:ii_cpi_project/components/CustomContainer.dart';
import 'package:ii_cpi_project/models/postClass.dart';
import 'package:ii_cpi_project/screens/Profile.dart';

class Post extends StatefulWidget {
  final PostClass post;
  Post({@required this.post});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final userName = 'Profile name';
  int maxlines = 2;
  bool trajetIsDetailed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Container(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Image.asset('images/logo.png'),
                ),
                title: Text(userName),
                subtitle: Text(widget.post.postingDate == null
                    ? 'Just now'
                    : widget.post.postingDate.toString()),
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
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
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
                          widget.post.description,
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
                    // Container(
                    //   height: 150,
                    //   // width: double.infinity,
                    //   padding: EdgeInsets.all(10),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     textDirection: TextDirection.rtl,
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           CustomContainer(
                    //             text: widget.post.vehicule.toString(),
                    //             icon: Icons.train_rounded,
                    //             subtitle: 'نوع المركبة',
                    //           ),
                    //           CustomContainer(
                    //             icon: Icons.phone,
                    //             text: '${widget.post.phoneNumber}',
                    //             subtitle: 'رقم الهاتف',
                    //           )
                    //         ],
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           CustomContainer(
                    //             icon: Icons.timer,
                    //             text: widget.post.time,
                    //             subtitle: 'الوقت',
                    //           ),
                    //           CustomContainer(
                    //             icon: Icons.timer,
                    //             text: widget.post.date,
                    //             subtitle: 'تاريخ الانطلاق',
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Divider(),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            trajetIsDetailed = !trajetIsDetailed;
                          });
                        },
                        child: trajetIsDetailed
                            ? DetailedTrajet(
                                trajet: widget.post.trajet,
                              )
                            : TrajetContainer(
                                trajet: widget.post.trajet,
                              ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("     نقطة الاتطلاق  :    "),
              Chip(
                label: Text("مسيلة"),
                avatar: Icon(
                  Icons.location_on_outlined,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("    نقطة الوصول  :     "),
              Chip(
                label: Text("سطيف"),
                avatar: Icon(
                  Icons.location_on_outlined,
                ),
              ),
            ],
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
    return Container(
      margin: EdgeInsets.all(10),
      child: chipList(TransformStringToChip(trajet)),
    );
  }
}
