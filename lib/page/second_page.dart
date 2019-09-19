import 'package:flutter/material.dart';

class NotificationLandingPage extends StatelessWidget {
  final String payload;

  const NotificationLandingPage({
    @required this.payload,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'New listing! - PG in BTM layout!',
            style: Theme.of(context).textTheme.title,//Theme of is a type of inherited widget
          ),
          const SizedBox(height: 8),
          Text(
            //payload,
            "Twin Sharing 20K per month with all facilities",
            style: Theme.of(context).textTheme.subtitle,
          ),
          const SizedBox(height: 8),
          RaisedButton(
            child: Text('Back to Home Page'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.blueGrey.shade200,
  );
}