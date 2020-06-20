import 'package:flutter/material.dart';

class InfoModal extends StatelessWidget {
  final String title;
  final String message;
  final Function onCheckButtonPressed;

  const InfoModal({Key key,@required this.title, @required this.message, this.onCheckButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height / 3),
      decoration: BoxDecoration(color: ThemeData.dark().dialogBackgroundColor, borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.headline5),
          Text(message),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: onCheckButtonPressed,
              child: Icon(Icons.check, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
