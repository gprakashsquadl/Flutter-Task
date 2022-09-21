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
        appBar: AppBar(
          title: const Text('Detail Screen'),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 1, blurRadius: 5)
                    ],
                    // border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 180,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
                          child: Center(
                            child: Text(
                              homePageProvider
                                  .teamMatesModelList[
                                      homePageProvider.chosenIndex]
                                  .name![0]
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigoAccent),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        margin: const EdgeInsets.all(5),
                        child: Text(
                          homePageProvider
                              .teamMatesModelList[homePageProvider.chosenIndex]
                              .name!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_city,
                              color: Colors.indigoAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              homePageProvider
                                      .teamMatesModelList[
                                          homePageProvider.chosenIndex]
                                      .stateProvince! +
                                  ", " +
                                  homePageProvider
                                      .teamMatesModelList[
                                          homePageProvider.chosenIndex]
                                      .country!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: Colors.indigoAccent,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              homePageProvider
                                  .teamMatesModelList[
                                      homePageProvider.chosenIndex]
                                  .webPages![0],
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
