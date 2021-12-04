import 'package:flutter/material.dart';
import 'package:http_test_app/domain/DB/api_client.dart';

import 'data_seralize.dart';


class HomeWidgetModel extends ChangeNotifier{
  final apiClient = ApiClient();
    var _post = <JesData>[];
  List<JesData> get results =>_post;

  Future<void> reloadJesData() async {
    final results =await apiClient.getJesDatas();
    _post += results;
    notifyListeners();
  }
  void createJesData() {}
}

class HomeModelProvider extends InheritedNotifier{
  final HomeWidgetModel model;

  const HomeModelProvider({ Key? key, required this.model, required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static HomeModelProvider? wach(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeModelProvider>();
  }

  static HomeModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<HomeModelProvider>()?.widget;
    return widget is HomeModelProvider ? widget : null;
  }

}