import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapptask/constants/color_constants.dart';

class HomeCardscreen extends StatefulWidget {
  const HomeCardscreen({Key? key}) : super(key: key);

  @override
  State<HomeCardscreen> createState() => _HomeCardscreenState();
}

class _HomeCardscreenState extends State<HomeCardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          20,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.amber,
                child: Container(
                  width: 30,
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                          'fffffffffffffffffff',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(backgroundColor: Colors.amber),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
