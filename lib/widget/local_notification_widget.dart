import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/local_notications_helper.dart';
import 'package:flutter_notification/page/second_page.dart';


class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
// The framework calls createState the first time a widget appears at a given
// location in the tree. If the parent rebuilds and uses the same type of
// widget (with the same key), the framework re-uses the State object
// instead of creating a new State object.

}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    //After calling createState() on the StatefulWidget, the framework inserts the new state object
    // into the tree and then calls initState() on the state object.
    // A subclass of State can override initState to do work that needs to happen just once.
    // For example, override initState to configure animations or to subscribe to platform services.
    // Implementations of initState are required to start by calling super.initState.
    final settingsAndroid = AndroidInitializationSettings('icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NotificationLandingPage(payload: payload)),
  );//Mobile apps typically reveal their contents via full-screen elements called "screens" or "pages".
  // In Flutter these elements are called routes and they're managed by a Navigator widget.
  // The navigator manages a stack of Route objects and provides methods for managing the stack,
  // like Navigator.push and Navigator.pop.

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: <Widget>[
        title('New Products listing'),
        RaisedButton(
          child: Text('Product code XXXX'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'Price', body: '00000'),
        color: Colors.deepOrangeAccent,
        ),

/*        RaisedButton(
          child: Text('Replace notification'),
          onPressed: () => showOngoingNotification(notifications,
              title: 'ReplacedTitle', body: 'ReplacedBody'),
        ),
        RaisedButton(
    child: Text('Other notification'),
    onPressed: () => showOngoingNotification(notifications,
        title: 'OtherTitle', body: 'OtherBody', id: 20),
  ),*/
     RaisedButton(
        child: Text('Delayed notification'),
       color: Colors.deepOrangeAccent,
        onPressed: () => Future.delayed(Duration(seconds:15),()=>showOngoingNotification(notifications,
            title: 'Firing after a 15second delay', body: 'OtherBody', id: 20)),
      ),
        const SizedBox(height: 32),
        title('Alerts'),
        RaisedButton(
          child: Text('The product on your wishlist is on sale'),
          color: Colors.deepOrangeAccent,
          onPressed: () => showSilentNotification(notifications,
              title: 'Discount', body: '30%', id: 30),
        ),
        const SizedBox(height: 32),
        title('Cancel'),
        RaisedButton(
          child: Text('Cancel all notification'),
          onPressed: notifications.cancelAll,
        ),
      ],
    ),
  );

  Widget title(String text) => Container(
    margin: EdgeInsets.symmetric(vertical: 4),
    child: Text(
      text,
      style: Theme.of(context).textTheme.title,
      textAlign: TextAlign.center,
    ),
  );
}

//TODO Concerns: Notification builder for different use cases
//TODO User chooses option silent notification
//TODO On pressed must include directing to the correct Activity page
//TODO cancel notifications must include "Nothing to cancel" if there are no notifications
//TODO floating button for notifications page for cancel notifications using cancel icon in assets
//TODO Once notification is read the notifications must disappear from the system tray, why is it persisting?
//TODO Make a List view of all the notifications
