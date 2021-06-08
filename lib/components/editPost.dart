import 'package:flutter/material.dart';


class EditPost extends StatefulWidget {

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
        child: Card(
          elevation: 4,
          color: Colors.white60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                  onTap: (){
                    setState(() {

                    });
                  },
                  child: Row(
                    children: [
                      Text("تعديل",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.edit),
                      ),

                    ],
                  )),
              GestureDetector(
                  onTap: (){
                    setState(() {

                    });
                  },
                  child: Row(
                    children: [
                      Text("حذف",
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.delete_rounded),
                      ),

                    ],
                  ),),

            ],
          ),
        ),
      ),
    );
  }
}
