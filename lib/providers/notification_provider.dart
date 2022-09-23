import 'package:flutter/foundation.dart';
import 'package:flutterapptask/models/samplepojo.dart';
import 'package:flutterapptask/providers/app_provider.dart';
import 'package:flutterapptask/services/api_services.dart';
import 'package:provider/provider.dart';

class NotificationProvider with ChangeNotifier {
  List<samplelistpojo> usesamplepoji = [];
  late AppProvider appProvider;

  Future<void> CallSampleList(context) async {
    print('TEST');
    appProvider = Provider.of<AppProvider>(context, listen: false);
    List assignedEmployeesList = [];
    if (usesamplepoji.isEmpty) {
      List<dynamic> assigedEmployeesResponse = await ApiServices.getMethod(
          'https://jsonplaceholder.typicode.com/todos');
      assignedEmployeesList = assigedEmployeesResponse;
      print('$assignedEmployeesList');

      usesamplepoji = assignedEmployeesList
          .map<samplelistpojo>((json) => samplelistpojo.fromJson(json))
          .toList();
      print('$usesamplepoji');
    }
    notifyListeners();
  }
}
