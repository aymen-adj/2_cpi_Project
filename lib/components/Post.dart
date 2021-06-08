import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ii_cpi_project/components/Chips.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/models/postClass.dart';
import 'package:ii_cpi_project/screens/Profile.dart';

class Post extends StatefulWidget {
  final PostClass post;
  final bool isOffer;
  Post({@required this.post, @required this.isOffer});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  double h;

  final userName = 'Profile name';
  int maxlines = 2;
  bool trajetIsDetailed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
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
                            maxlines == 3 && TextOverflow.values != []
                                ? maxlines = 50
                                : maxlines = 3;
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
                                  title: Text(widget.post.date),
                                  subtitle: Text("تاريخ الانطلاق"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.commute),
                                  title: Text(widget.post.vehicule),
                                  subtitle: Text("نوع المركبة"),
                                ),
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      makePhoneCall("0${widget.post.phoneNumber}");
                                    });
                                  },
                                  onLongPress: () {
                                    Clipboard.setData(ClipboardData(
                                        text: "0${widget.post.phoneNumber}"));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        'تم النسخ   ',
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: Duration(milliseconds: 600),
                                    ));
                                  },
                                  leading: Icon(Icons.phone),
                                  title: Text("0${widget.post.phoneNumber}"),
                                  subtitle: Text("الهاتف"),
                                ),
                                DetailedTrajet(
                                  trajet: widget.post.trajet,
                                )
                              ],
                            )
                          : ListTile(
                              leading: Icon(Icons.calendar_today_rounded),
                              title: Text(widget.post.date),
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
    if (trajet==null){
      trajet=['none'];
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
