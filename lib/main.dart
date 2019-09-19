import 'package:flutter/material.dart';
import 'package:flutter_notification/widget/local_notification_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Local Notifications';
  @override
  Widget build(BuildContext context) => MaterialApp(//Widget tree in equivalent of XML in android
    title: appTitle,
    theme: new ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: MainPage(appTitle: appTitle),
  );
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(appTitle),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: LocalNotificationWidget(),
    ),
    backgroundColor: Colors.blueGrey.shade200,
  );
}

/*child: DecoratedBox(
decoration: BoxDecoration(color: Colors.deepPurple),
child: Padding(
padding: const EdgeInsets.all(8.0),
child: Text('Rocky'),
)
)*/