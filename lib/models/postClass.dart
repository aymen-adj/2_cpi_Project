//*NOTICE :
// !les proprieties واحد ما يبدل الترتيب تاع
class PostClass {
  final int userId;
  final postID;
  final DateTime postingDate;
  final String date;
  final List<String> trajet;
  final String vehicule;
  final String description;
   String phoneNumber;
  final String time;
  bool complete=false;

  PostClass({
    this.userId,
    this.postID,
    this.postingDate,
    this.date,
    this.trajet,
    this.vehicule,
    this.description,
    this.phoneNumber,
    this.time,
    //this.complete,
  });
}
