import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* hadi ay mazal ma kamlatch so >>mat5rbch<<
* aw karim ya5dm fi had screen
*--------------------------------------
*| >>>>>>>>>>>mat5rabch<<<<<<<<<<<<<<<|
*--------------------------------------
*/
class Demande extends StatefulWidget {
  @override
  _DemandeState createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 6,
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
                  Divider(
                      //indent: 40,
                      //color: Colors.black26,
                      //endIndent: 40,
                      //thickness: 1,
                      ),
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
