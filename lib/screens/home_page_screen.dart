import 'package:flutter/material.dart';
import 'package:flutterapptask/constants/color_constants.dart';
import 'package:flutterapptask/constants/string_constants.dart';
import 'package:flutterapptask/models/listpoji.dart';
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
          appBar: AppBar(
            title: const Text('Home'),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(child: _autoCompleteName(homePageProvider)),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: homePageProvider.teamMatesModelList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                          child: InkWell(
                            child: Container(
                              //color: Colors.grey,

                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 0.5,
                                            blurRadius: 0.5)
                                      ]),
                                  child: ListTile(
                                    leading: Container(
                                      alignment: Alignment.center,
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFFe0f2f1)),
                                      child: Text(
                                        homePageProvider
                                            .teamMatesModelList[index].name![0]
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigoAccent),
                                      ),
                                    ),
                                    subtitle: Container(
                                      padding: EdgeInsets.all(2),
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        homePageProvider
                                            .teamMatesModelList[index]
                                            .stateProvince!,
                                      ),
                                    ),
                                    title: Container(
                                      padding: EdgeInsets.all(2),
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        homePageProvider
                                            .teamMatesModelList[index].name!,
                                        style: TextStyle(
                                            //overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              homePageProvider.chosenIndex = index;
                              NavigationServices.changeScreen(
                                  context, const DetailsPageScreen());
                            },
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
          padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2)
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
                            padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(158, 158, 158, 1)
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
                                            BoxShadow(
                                                color: Colors.white24,
                                                spreadRadius: 3,
                                                blurRadius: 10)
                                          ]),
                                      child: ListTile(
                                        leading: Container(
                                          alignment: Alignment.center,
                                          width: 80,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFe0f2f1)),
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .name![0]
                                                .toUpperCase(),
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.indigoAccent),
                                          ),
                                        ),
                                        subtitle: Container(
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(5),
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .stateProvince!,
                                          ),
                                        ),
                                        title: Container(
                                          padding: EdgeInsets.all(2),
                                          margin: EdgeInsets.all(5),
                                          child: Text(
                                            homePageProvider
                                                .teamMatesModelList[index]
                                                .name!,
                                            maxLines: 1,
                                            style: TextStyle(
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
