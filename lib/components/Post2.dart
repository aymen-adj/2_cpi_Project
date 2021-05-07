import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post2 extends StatefulWidget {
  @override
  _Post2State createState() => _Post2State();
}

class _Post2State extends State<Post2> {
  double h = null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 4,
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Image.asset('images/logo.png'),
              ),
              title: Text("userName"),
              subtitle: Text('Just now'),
              trailing: DropdownButton(
                underline: Container(
                  width: 1,
                ),
                icon: Icon(Icons.more_horiz_rounded),
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
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'السلام عليكم \n'
                      'راني رايح من الجلفة لسطيف بصح ندخل لجيجل قبل. لي محتاج اي حاجة يعيطلي في التيليفون , رقم الهاتف راه واضح عندكم صحاب التطبيق هذا سهلولكم كلش ',
                    ),
                  ),
                  AnimatedContainer(
                    height: h,
                    duration: Duration(seconds: 10),
                    child: Column(
                      children: [
                        Divider(),
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
                  ),
                  ExpansionTile(
                    onExpansionChanged: (_) {
                      if (h == null)
                        h = 0;
                      else
                        h = null;
                      print(h);
                      setState(() {});
                    },
                    title: Text("المزيد"),
                    expandedAlignment: Alignment.topRight,
                    children: [
                      ListTile(
                        leading: Icon(Icons.calendar_today_sharp),
                        title: Text("0543567843"),
                        subtitle: Text("الهاتف"),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("0543567843"),
                        subtitle: Text("الهاتف"),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("0543567843"),
                        subtitle: Text("الهاتف"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
