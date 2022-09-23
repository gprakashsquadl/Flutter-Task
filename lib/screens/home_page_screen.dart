import 'package:flutter/material.dart';
import 'package:flutterapptask/constants/color_constants.dart';
import 'package:flutterapptask/constants/string_constants.dart';
import 'package:flutterapptask/models/listpoji.dart';
import 'package:flutterapptask/screens/helpsupport.dart';
import 'package:flutterapptask/screens/notifications.dart';
import 'package:provider/provider.dart';
import 'package:flutterapptask/providers/home_page_provider.dart';
import 'package:flutterapptask/screens/details_page_screen.dart';
import 'package:flutterapptask/services/navigation_services.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageProvider>(context, listen: false).getmethod(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
        builder: (context, HomePageProvider homePageProvider, snapshot) {
      return Scaffold(
          appBar: AppBar(title: const Text('Home'), actions: [
            IconButton(
              icon: const Icon(Icons.help),
              onPressed: () {
                NavigationServices.changeScreen(context, const helpsupport());
              },
            ),
            IconButton(
                icon: const Icon(
                  Icons.notifications,
                ),
                onPressed: () {
                  print('Notifications');
                  NavigationServices.changeScreen(
                      context, const Notificationsscreen());
                }),
          ]),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(child: _autoCompleteName(homePageProvider)),
                ),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                      itemCount: homePageProvider.teamMatesModelList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            homePageProvider.chosenIndex = index;
                            NavigationServices.changeScreen(
                                context, const DetailsPageScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              // child: Text('hi'),

                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      const BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 0.5,
                                          blurRadius: 0.5)
                                    ]),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .country!
                                                .toUpperCase(),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )),
                                    VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          width: 80,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFe0f2f1)),
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .name![0]
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.indigoAccent),
                                          ),
                                        )),
                                    VerticalDivider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                        flex: 8,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Align(
                                                  child: Center(
                                                    child: Text(
                                                      homePageProvider
                                                          .teamMatesModelList[
                                                              index]
                                                          .name!
                                                          .toUpperCase(),
                                                      maxLines: 1,
                                                      style: const TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  homePageProvider
                                                      .teamMatesModelList[index]
                                                      .stateProvince!,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .stateProvince!,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.amber,
                  child: const Text(
                    'Store View',
                    style: TextStyle(
                        color: Colors.white,

                        //backgroundColor: Colors.grey,
                        fontSize: 20),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      // scrollDirection: Axis.horizontal,

                      itemCount: homePageProvider.teamMatesModelList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                          child: InkWell(
                            child: Container(
                              //color: Colors.grey,
                              //  alignment: AlignmentGeometry(Colors.accents),

                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            const BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 0.5,
                                                blurRadius: 0.5)
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            width: 80,
                                            height: 80,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFFe0f2f1)),
                                            child: Text(
                                              homePageProvider
                                                  .teamMatesModelList[index]
                                                  .name![0]
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.indigoAccent),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(10),
                                            child: Text(
                                              homePageProvider
                                                  .teamMatesModelList[index]
                                                  .name!
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ));
    });
  }

  Widget _autoCompleteName(HomePageProvider homePageProvider) {
    return RawAutocomplete<Allunivpojo>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isNotEmpty) {
          return homePageProvider.teamMatesModelList
              .where((Allunivpojo val) => val.name!
                  .toLowerCase()
                  .startsWith(textEditingValue.text.toLowerCase()))
              .toList();
        } else {
          return [];
        }
      },
      textEditingController: homePageProvider.autocompleteresults,
      focusNode: homePageProvider.autoCompleteFocusNode,
      displayStringForOption: (Allunivpojo option) => option.name!,
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return Container(
          padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
                    color: Colors.grey, spreadRadius: 1, blurRadius: 2)
              ]),
          child: Center(
              child: Column(
            children: [
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.left,
                decoration: const InputDecoration(
                  hintText: Stringconstraints.txtsearch,
                  counterText: '',
                  suffixIcon: Icon(Icons.search),
                  // border: BoxShadow
                  border: InputBorder.none,
                ),
                controller: homePageProvider.autocompleteresults,
                focusNode: homePageProvider.autoCompleteFocusNode,
              ),
            ],
          )),
        );
        // return TextField(
        //   controller: homePageProvider.autocompleteresults,
        //   focusNode: homePageProvider.autoCompleteFocusNode,
        //   decoration: const InputDecoration(hintText: 'Search'),
        // );
      },
      onSelected: (Allunivpojo selection) {},
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Allunivpojo> onSelected,
          Iterable<Allunivpojo> options) {
        return Align(
          child: Material(
            color: Colors.white,
            child: SizedBox(
              child: Container(
                //height: double.parse(200 * options.length),
                height: 300.0 * (options.length),
                child: Scrollbar(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Allunivpojo option = options.elementAt(index);

                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                          homePageProvider.chosenIndex =
                              homePageProvider.teamMatesModelList.indexWhere(
                                  (element) => element.name == option.name);
                          //   NavigationServices.changeScreen(
                          //       context, const DetailsPageScreen());
                        },
                        child: ListTile(
                          title: Container(
                            height: 100,
                            padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          const Color.fromRGBO(158, 158, 158, 1)
                                              .withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5)
                                ]),
                            child: Column(
                              children: [
                                // Text(
                                //   option.name!,
                                // ),
                                Container(
                                  //color: Colors.grey,

                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            const BoxShadow(
                                                color: Colors.white24,
                                                spreadRadius: 3,
                                                blurRadius: 10)
                                          ]),
                                      child: ListTile(
                                        leading: Container(
                                          alignment: Alignment.center,
                                          width: 80,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFe0f2f1)),
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .name![0]
                                                .toUpperCase(),
                                            maxLines: 1,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.indigoAccent),
                                          ),
                                        ),
                                        subtitle: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(5),
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .stateProvince!,
                                          ),
                                        ),
                                        title: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(5),
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .name!,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
