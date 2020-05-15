import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  final String friendName;
  final String imageURL;
  final int bDay;
  var onPressed;

  ChatButton({this.friendName, this.onPressed, this.imageURL, this.bDay});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Material(
      elevation: 2.0,
      color: Colors.white70,
      child: MaterialButton(
        onPressed: onPressed,
        height: screenHeight / 10,
        child: ListTile(
          contentPadding: EdgeInsets.all(4.0),
          leading: imageURL != null ? CircleAvatar(
            radius: 30,
            backgroundColor: Theme
                .of(context)
                .backgroundColor,
            backgroundImage: AssetImage('images/loading.png'),
            child: ClipOval(
              child: new SizedBox(
                width: 180,
                height: 180,
                child: imageURL != null ? Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                ) : Container(
                  color: Theme
                      .of(context)
                      .backgroundColor,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/loading.png'),
                    ),
                  ),
                ),

              ),
            ),
          ) : CircleAvatar(
            //backgroundImage: AssetImage('images/user1.png'),
            backgroundColor: Colors.white70,
            radius: 32.0,
            child: ClipOval(
              child: new SizedBox(
                width: 180,
                height: 180,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                friendName,
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                recentText(),
                style: Theme
                    .of(context)
                    .textTheme
                    .body2,
              ),
            ],
          ),
          trailing: bDay == 1 ? Icon(
            Icons.cake,
            color: Theme
                .of(context)
                .splashColor,
          ) : Icon(
            Icons.remove_circle_outline,
          ),
        ),
      ),
    );
  }
}

String recentText() {
  return 'Hey! Whats up!';
}


