import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notificationsscreen extends StatefulWidget {
  const Notificationsscreen({Key? key}) : super(key: key);

  @override
  State<Notificationsscreen> createState() => _NotificationsscreenState();
}

class _NotificationsscreenState extends State<Notificationsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Center(
          child: Container(
            child: Text('Notifications'),
          ),
        ));
  }
}
