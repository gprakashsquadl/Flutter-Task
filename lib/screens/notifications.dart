import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapptask/providers/notification_provider.dart';
import 'package:provider/provider.dart';

class Notificationsscreen extends StatefulWidget {
  const Notificationsscreen({Key? key}) : super(key: key);

  @override
  State<Notificationsscreen> createState() => _NotificationsscreenState();
}

class _NotificationsscreenState extends State<Notificationsscreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NotificationProvider>(context, listen: false)
          .CallSampleList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(builder:
        (context, NotificationProvider notificationProvider, snapshot) {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey[200],
          bottomOpacity: 1.0,
          title: Text(
            'YOUR CUSTOM APPBAR',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          actions: <Widget>[Icon(Icons.search)],
          elevation: 0,
          backgroundColor: Colors.cyan,
          automaticallyImplyLeading: true,
        ),
        // appBar: AppBar(
        //   title: Text(''),
        // ),
        // body: Center(
        //   child: Container(
        //     child: Text(notificationProvider.usesamplepoji[0].title!),
        //   ),
        // )

        body: ListView.builder(
            itemCount: notificationProvider.usesamplepoji.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          color: Colors.lime,
                          child: Text(
                            notificationProvider.usesamplepoji[index].title!,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            notificationProvider.usesamplepoji[index].title!,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            notificationProvider.usesamplepoji[index].title!,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
