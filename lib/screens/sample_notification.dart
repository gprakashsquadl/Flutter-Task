import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptask/models/PushNotification.dart';
import 'package:flutterapptask/screens/NotificationBadge.dart';
import 'package:overlay_support/overlay_support.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  late int _totalNotifications;
  late final FirebaseMessaging _messaging;
  PushNotification? _notificationInfo;

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }

  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
      print("Handling a background message");

      // Parse the message received
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
        dataTitle: message.data['title'],
        dataBody: message.data['body'],
      );
      print('notificationsGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG');
      print('${message.notification?.title}');
      print('${message.notification?.body}');
      pushnotify = message.notification!.body!;
      title = message.notification!.title!;

      print('$notification');
      setState(() {
        print('${message.notification?.title}');
        print('${message.notification?.body}');
        print('DONE');

        print('$notification');
        _notificationInfo = notification;
        _totalNotifications++;
      });
      if (_notificationInfo != null) {
        // For displaying the notification as an overlay
        print('notifititle');
        print('notifititle');
        print('${_notificationInfo!.body}');

        showSimpleNotification(
          Text(_notificationInfo!.title!),
          leading: NotificationBadge(totalNotifications: _totalNotifications),
          subtitle: Text(_notificationInfo!.body!),
          background: Colors.cyan.shade700,
          duration: const Duration(seconds: 2),
        );
      }
    }

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print('User granted permission');
    //   // TODO: handle the received notifications
    // } else {
    //   print('User declined or has not accepted permission');
    // }

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        print('notificationsssssssssssssssssss');
        print('${message.notification?.title}');
        print('${message.notification?.body}');
        pushnotify = message.notification!.body!;
        title = message.notification!.title!;

        print('$notification');
        setState(() {
          print('${message.notification?.title}');
          print('${message.notification?.body}');
          print('DONE');

          print('$notification');
          _notificationInfo = notification;
          _totalNotifications++;
        });
        if (_notificationInfo != null) {
          // For displaying the notification as an overlay
          print('notifititle');
          print('notifititle');
          print('${_notificationInfo!.body}');

          showSimpleNotification(
            Text(_notificationInfo!.title!),
            leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notificationInfo!.body!),
            background: Colors.cyan.shade700,
            duration: const Duration(seconds: 2),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  String title = "";
  String pushnotify = "";
  @override
  void initState() {
    _totalNotifications = 0;
    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );
      setState(() {
        print('onMessageOpenedApp');
        print('${message.notification?.body}');
        print('${message.notification?.title}');

        print('onMessageOpenedApp');

        _notificationInfo = notification;
        _totalNotifications++;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: Scaffold(
        appBar: AppBar(
          // title: Text(_totalNotifications.toString()),
          title: Text('Notifications'),

          actions: <Widget>[
            new Container(),
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: new IconButton(
                icon: new Icon(Icons.notifications),
                tooltip: 'Closes application',
                onPressed: () {},
              ),
            ),
            Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
              decoration: new BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: new Text(
                  _totalNotifications.toString(),
                  textScaleFactor: 1.5,
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],

          //brightness: Brightness.dark,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Push Notifications'
                "\n"
                "\n"
                'Tile : '
                //  '${title}'
                '${_notificationInfo!.dataBody ?? _notificationInfo!.title}'
                ",\n"
                'Body : '
                //  '${pushnotify}'
                '${_notificationInfo!.dataTitle ?? _notificationInfo!.body}'
                '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.2, // the height between text, default is 1.0
                    letterSpacing: 1.0),
              ),
            ),
            const SizedBox(height: 16.0),
            // NotificationBadge(totalNotifications: _totalNotifications),
            const SizedBox(height: 16.0),
            // TODO: add the notification text here
          ],
        ),
      ),
    );
  }
}
