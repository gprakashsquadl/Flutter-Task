import 'package:flutter/material.dart';
import 'package:flutterapptask/models/listpoji.dart';
import 'package:provider/provider.dart';
import 'package:flutterapptask/providers/app_provider.dart';
import 'package:flutterapptask/services/api_services.dart';

class HomePageProvider with ChangeNotifier {
  late AppProvider appProvider;
  TextEditingController autocompleteresults = TextEditingController();
  FocusNode autoCompleteFocusNode = FocusNode();
  List<Allunivpojo> teamMatesModelList = [];
  int chosenIndex = 0;

  Future<void> getmethod(context) async {
    appProvider = Provider.of<AppProvider>(context, listen: false);
    List assignedEmployeesList = [];
    if (teamMatesModelList.isEmpty) {
      List<dynamic> assigedEmployeesResponse = await ApiServices.getMethod(
          'http://universities.hipolabs.com/search?country=India');
      assignedEmployeesList = assigedEmployeesResponse;
      teamMatesModelList = assignedEmployeesList
          .map<Allunivpojo>((json) => Allunivpojo.fromJson(json))
          .toList();
    }
    notifyListeners();
  }
}
