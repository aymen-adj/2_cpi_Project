import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Formule.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(title: Text("أرسل رايك")),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  "رأيك يهم!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "رأيك وأفكارك مهمة حقًا بالنسبة لنا ،",
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                )),
                Center(
                    child: Text(
                  "أخبرنا إذا كان لديك أي تعليقات",
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                )),
                Center(
                    child: Text(
                  "أو اقتراحات بالإضافة إلى ما يعجبك أو لا يعجبك في تطبيقنا.",
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                )),
                SizedBox(
                  height: 30,
                ),
                StarIcon(),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'تعليقك',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150.0),
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('إرسال'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

typedef void RatingChangeCallback(int rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final int rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5, this.rating = 0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star,
        color: Colors.grey.shade400,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return IconButton(
      onPressed:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1),
      icon: icon,
      iconSize: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(starCount, (index) => buildStar(context, index)),
    );
  }
}

class StarIcon extends StatefulWidget {
  @override
  _StarIconState createState() => _StarIconState();
}

class _StarIconState extends State<StarIcon> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return StarRating(
      rating: rating,
      color: Colors.blue,
      onRatingChanged: (rating) => setState(() => this.rating = rating),
    );
  }
}
