import 'package:flutter/material.dart';
import 'package:flutterapptask/constants/color_constants.dart';
import 'package:provider/provider.dart';
import 'package:flutterapptask/providers/home_page_provider.dart';

class DetailsPageScreen extends StatefulWidget {
  const DetailsPageScreen({Key? key}) : super(key: key);

  @override
  State<DetailsPageScreen> createState() => _DetailsPageScreenState();
}

class _DetailsPageScreenState extends State<DetailsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
        builder: (context, HomePageProvider homePageProvider, _) {
      return Scaffold(
        backgroundColor: ColorConstraints.bg_splashscreen,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                subtitle: Center(
                  child: Text(homePageProvider
                      .teamMatesModelList[homePageProvider.chosenIndex].name!),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
