import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class helpsupport extends StatefulWidget {
  const helpsupport({Key? key}) : super(key: key);

  @override
  State<helpsupport> createState() => _helpsupportState();
}

class _helpsupportState extends State<helpsupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('')),
        body: Center(
            child: Container(
          child: Text('Help & Support'),
        )));
  }
}
