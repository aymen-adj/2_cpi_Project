import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ii_cpi_project/Connections/Functions.dart';
import 'package:ii_cpi_project/components/Chips.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/models/postClass.dart';
import 'package:ii_cpi_project/models/user.dart';
import 'package:ii_cpi_project/screens/Profile.dart';

class Post extends StatefulWidget {
  final PostClass post;
  final bool isOffer;
  final User user;
  Post({@required this.post, @required this.isOffer, this.user});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  double h;
  int maxlines = 2;
  bool trajetIsDetailed = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Card(
        elevation: 7,
        color: Colors.white,
        child: Container(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: widget.user.firstName == null
                      ? Text("${Icons.emoji_emotions}")
                      : Text(widget.user.firstName[0].toUpperCase(),style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                ),
                title: Text(widget.user.firstName == null
                    ? ' no name'
                    : widget.user.firstName + " " + widget.user.famillyName),
                subtitle: Text(widget.post.postingDate == null
                    ? 'Just now'
                    : widget.post.postingDate.toString().substring(0, 16)),
                trailing: DropdownButton(
                  underline: Container(
                    width: 1,
                  ),
                  icon: Icon(Icons.more_horiz_rounded),
                  // dropdownColor: Colors.blueGrey,
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
                    widget.post.complete
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(("ممتلئ")),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.check_circle,
                                    size: 30, color: Colors.green),
                              ),
                            ],
                          )
                        : Container(),
                    Container(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            maxlines == 3 && TextOverflow.values != []
                                ? maxlines = 50
                                : maxlines = 3;
                            {
                              maxlines == 3 && TextOverflow.values != []
                                  ? maxlines = 50
                                  : maxlines = 3;
                            }
                          });
                        },
                        child: Text(
                          widget.post.description,
                          style: TextStyle(fontSize: 16),
                          textDirection: TextDirection.rtl,
                          maxLines: maxlines,
                          overflow: TextOverflow.values == []
                              ? null
                              : TextOverflow.ellipsis,
                          semanticsLabel: 'see more',
                        ),
                      ),
                    ),
                    Divider(),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        height: h,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              trajetIsDetailed = !trajetIsDetailed;
                            });
                          },
                          child: TrajetContainer(
                            trajet: widget.post.trajet,
                          ),
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: widget.isOffer
                          ? ExpansionTile(
                              title: Text("المزيد"),
                              expandedAlignment: Alignment.topRight,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.calendar_today_rounded),
                                  title: Text(widget.post.time +
                                      " " +
                                      widget.post.date.substring(0, 10)),
                                  subtitle: Text("تاريخ الانطلاق"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.commute),
                                  title: Text(widget.post.vehicule),
                                  subtitle: Text("نوع المركبة"),
                                ),
                                DetailedTrajet(
                                  trajet: widget.post.trajet,
                                ),
                                ListTile(
                                    title: TextButton(
                                  child: Text('الإشتراك',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  onPressed: () {
                                    if (thisUser.id != widget.user.id) {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              content: Container(
                                                  height: 95,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          "هل أنت متأكد من الإشتراك"),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        children: [
                                                          TextButton(
                                                              onPressed: () {
                                                                SendNotification(
                                                                    widget.user
                                                                        .token,
                                                                    "يريد " +
                                                                        thisUser
                                                                            .firstName +
                                                                        " " +
                                                                        thisUser
                                                                            .famillyName +
                                                                        " المشاركة في منشورك");
                                                                insertNotification(
                                                                    widget.user
                                                                        .id,
                                                                    thisUser.id,
                                                                    thisUser.firstName +
                                                                        thisUser
                                                                            .famillyName,
                                                                    "يريد الإشتراك في منشورك");
                                                                Navigator.pop(
                                                                    context);
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          AlertDialog(
                                                                    title:
                                                                        Directionality(
                                                                      textDirection:
                                                                          TextDirection
                                                                              .rtl,
                                                                      child:
                                                                          Text(
                                                                        "تم الإشتراك بنجاح !",
                                                                      ),
                                                                    ),
                                                                    content: Container(
                                                                        height: 95,
                                                                        child: Column(
                                                                          children: [
                                                                            Text("رقم هاتف السائق هو " +
                                                                                widget.user.phoneNumber),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                TextButton(
                                                                                  child: Text(
                                                                                    "الإتصال",
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    makePhoneCall(widget.user.phoneNumber);
                                                                                  },
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 30,
                                                                                ),
                                                                                TextButton(
                                                                                    onPressed: () {
                                                                                      Clipboard.setData(ClipboardData(text: widget.user.phoneNumber));
                                                                                      Navigator.pop(context);
                                                                                      final snackbar = SnackBar(content: Text('تم نسخ رقم الهاتف'));
                                                                                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                                                                    },
                                                                                    child: Text('نسخ الرقم')),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        )),
                                                                  ),
                                                                );
                                                              },
                                                              child: Text(
                                                                  "تأكيد")),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  "إلغاء")),
                                                        ],
                                                      )
                                                    ],
                                                  ))));
                                    }
                                  },
                                ))
                              ],
                            )
                          : ListTile(
                              leading: Icon(Icons.calendar_today_rounded),
                              title:  Text(widget.post.date.substring(0,10)+" \n" + widget.post.date.substring(10,14)),
                              subtitle: Text("تاريخ الانطلاق"),
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

// ignore: must_be_immutable
class TrajetContainer extends StatelessWidget {
  List<String> trajet;

  TrajetContainer({this.trajet});
  @override
  Widget build(BuildContext context) {
    if (trajet == null) {
      trajet = ['none'];
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("     نقطة الاتطلاق  :    "),
              buildChip(trajet.first, 1)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("    نقطة الوصول  :     "),
              buildChip(trajet.last, trajet.length)
            ],
          ),
        ],
      ),
    );
  }
}

class DetailedTrajet extends StatelessWidget {
  final List<dynamic> trajet;
  DetailedTrajet({this.trajet});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListTile(
          title: chipList(
            transformStringToChip(trajet),
          ),
          leading: Icon(
            Icons.alt_route,
          )),
    );
  }
}
