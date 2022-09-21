import 'package:flutter/material.dart';
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
          body: Column(
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
                    padding: const EdgeInsets.all(6.0),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(
                              homePageProvider.teamMatesModelList[index].name!,
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
        return TextField(
          controller: homePageProvider.autocompleteresults,
          focusNode: homePageProvider.autoCompleteFocusNode,
          decoration: const InputDecoration(hintText: 'Search'),
        );
      },
      onSelected: (Allunivpojo selection) {},
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Allunivpojo> onSelected,
          Iterable<Allunivpojo> options) {
        return Align(
          child: Material(
            child: SizedBox(
              child: Container(
                child: Scrollbar(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(2.0),
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
                          title: Text(
                            option.name!,
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
