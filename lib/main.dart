import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptask/providers/notification_provider.dart';
import 'package:flutterapptask/screens/login_screen.dart';
import 'package:flutterapptask/screens/pushnotifications.dart';
import 'package:flutterapptask/screens/sample_notification.dart';
import 'package:provider/provider.dart';
import 'package:flutterapptask/constants/string_constants.dart';
import 'package:flutterapptask/providers/app_provider.dart';
import 'package:flutterapptask/providers/home_page_provider.dart';
import 'package:flutterapptask/providers/login_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterapptask/screens/splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await PushNotificationService().setupInteractedMessage();
// //FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   runApp(const MyApp());
//   RemoteMessage? initialMessage =
//       await FirebaseMessaging.instance.getInitialMessage();

//   if (initialMessage != null) {
//     // App received a notification when it was killed

//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider(create: (context) => LoginProvider()),
// //         ChangeNotifierProvider(create: (context) => AppProvider()),
// //         ChangeNotifierProvider(create: (context) => HomePageProvider()),
// //         ChangeNotifierProvider(create: (context) => NotificationProvider()),
// //       ],
// //       child: MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         home: const SplashScreen(),
// //       ),
// //     );
// //   }
// // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(widget.title),
//       // ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'notificationAlert',
//             ),
//             Text(
//               'messageTitle',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize('', [
    // notification icon
    NotificationChannel(
      channelGroupKey: 'basic_test',
      channelKey: 'basic',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic tests',
      channelShowBadge: true, //make it true, to show notifications counter
      importance: NotificationImportance.High,
      criticalAlerts: true,
      ledColor: Color(0xFF9D50DD),
      enableLights: true,
      enableVibration: true,
      locked: true,
      playSound: true,
      vibrationPattern: highVibrationPattern,
    ),
  ]);
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      //simgple notification
      id: 123,
      channelKey: 'basic', //set configuration wuth key "basic"
      title: 'Welcome to FlutterCampus.com',
      body: 'This simple notification with action buttons in Flutter App',
      payload: {"name": "FlutterCampus"},
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notify',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
