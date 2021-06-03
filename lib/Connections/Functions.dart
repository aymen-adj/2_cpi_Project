//
// import 'package:firebase_auth/firebase_auth.dart';
// import'package:flutter/material.dart';
// void PhoneFireBase({@required String phoneNumber,context,String Verification}) async {
//   FirebaseAuth auth=FirebaseAuth.instance;
//   auth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted:(credential){
//     auth.signInWithCredential(credential).then((value){
//       Navigator.popAndPushNamed(context, 'home');
//     });
//   }
// }, verificationFailed:(Erreur){print("Erreur");}, codeSent:(verify,val){Verification=verify;}, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
// }

import 'package:flutter/cupertino.dart';
import 'package:ii_cpi_project/components/Post.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/models/postClass.dart';
import 'package:ii_cpi_project/models/user.dart';
import 'package:mysql1/mysql1.dart';

var settings = ConnectionSettings(
  //host: '172.20.10.10',   //when using iphone
  host: "192.168.43.155",
  port: 3306,
  user: 'mosbah',
  password: 'mosbah',
  db: 'ftrigk',
);
void createPostToDB(
    var postingDate, date, trajet, vehicule, description, postType) async {
  var conn = await MySqlConnection.connect(settings);
  print(conn.toString());
  var r = await conn.query(
      "insert into Post (PostingDate,Date,Trajet,Vehicule,Description,PostType) values (?,?,?,?,?,?)",
      [postingDate, date, trajet, vehicule, description, postType]);
  print(r);
}

Stream<List<Widget>> importPosts({@required String postType}) async* {
  //! 0 --> demands 1--> offers
  //! there is a postType map in Constants. Use it.
  List<Widget> posts = [];
  var conn = await MySqlConnection.connect(settings);
  var result =
      await conn.query("SELECT * FROM `Post` WHERE PostType=?", [postType]);
  print(result);

  List<dynamic> entriesToPost = [];

  for (var r in result) {
    r.fields.forEach((key, value) {
      entriesToPost.add(value);
    });

    PostClass postClass = PostClass(
      userId: entriesToPost[0],
      postID: entriesToPost[1],
      postingDate: entriesToPost[2],
      date: entriesToPost[3].toString().substring(0, 10) +
          entriesToPost[3].toString().substring(
              entriesToPost[3].toString().length - 9,
              entriesToPost[3].toString().length),
      trajet: numToStringWilaya(entriesToPost[4].toString()),
      vehicule: entriesToPost[5].toString(),
      description: entriesToPost[6].toString(),
      phoneNumber: entriesToPost[8].toString(),
      // time: entriesToPost[9].toString(),
    );
    posts.add(Post(post: postClass, isOffer: true,));
    entriesToPost.clear();
  }
  try {
    yield posts;
  } catch (e) {
    print(e);
  }
}

void createuser(String firstName,famillyName, number) async {
  var conn = await MySqlConnection.connect(settings);
  await conn.query(
      "insert into user (FirstName,FamillyName,PhoneNumber) values (?,?)", [firstName,famillyName, number]);
}

 Future<bool> verifyNumber({@required phone}) async {
  var conn = await MySqlConnection.connect(settings);
  var result =
      await conn.query("SELECT * FROM `user` WHERE PhoneNumber=?", [phone]);
  if(result.isEmpty){return Future<bool>.value(false);}
  else{
    List<dynamic> entriesToUser = [];
    entriesToUser=result.first.toList();

    User user=User(
      id: entriesToUser[0],
      firstName: entriesToUser[1].toString(),
      famillyName: entriesToUser[2].toString(),
      phoneNumber: '0' + entriesToUser[3].toString(),
      rateAsClient: entriesToUser[4],
      rateAsDriver: entriesToUser[5],
    );
    thisUser=user;
    return Future<bool>.value(user!=null);
  }

}