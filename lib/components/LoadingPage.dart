import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmptyPost(),
            EmptyPost(),
            EmptyPost(),
          ],
        ),
        Container(
          child: Center(
              child: CircularProgressIndicator(
            strokeWidth: 4,
          )),
        ),
      ],
    );
  }
}

class EmptyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Expanded(
                child: Divider(
                  height: 1,
                ),
                flex: 2),
            Expanded(child: Container(), flex: 3),
          ],
        ),
       // elevation: 4,
        margin: EdgeInsets.all(10),
        color: Colors.white,
      ),
    );
  }
}
