import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'شكرا لك',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 20),
            ),
            Container(
              child: Text(
                '.تم تسليم طلبك بأمان وبنجاح',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 20),
            ),
            SizedBox(height: 30),
            Container(
              child: Text(
                'قيم تجربتك',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 20),
            ),
            SizedBox(height: 40),
            Text(
              '!!مذهلة',
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Container(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage('images/emoji2.png'),
              ),
            ),
            SizedBox(height: 20),
            StarIcon(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "ارسال",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
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
        Icons.star_border,
        color: Colors.black,
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
      iconSize: 36,
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
      color: Colors.yellow,
      onRatingChanged: (rating) => setState(() => this.rating = rating),
    );
  }
}
