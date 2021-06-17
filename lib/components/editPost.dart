import 'package:flutter/material.dart';


class EditPost extends StatefulWidget {

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  @override
  Widget build(BuildContext context) {
    Color color=Colors.grey[100];

    return  Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
        child: Card(
          elevation: 7,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: (){
                      setState(() {

                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("تعديل",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    )),
              ),Expanded(
                child: GestureDetector(
                    onTap: (){
                      setState(() {

                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("إنهاء",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.check_rounded),
                          ),
                        ],
                      ),
                    )),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: (){
                      setState(() {

                      });
                    },
                    child: Expanded(

                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("حذف",
                              style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.delete_rounded),
                            ),

                          ],
                        ),
                      ),
                    ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
