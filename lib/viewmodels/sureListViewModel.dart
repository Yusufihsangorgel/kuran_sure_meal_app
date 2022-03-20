import 'package:flutter/material.dart';
import 'package:kuran_sure_meal_app/services/KuranServices.dart';
import 'package:kuran_sure_meal_app/viewmodels/sureViewModel.dart';

enum Status { initial, loading, notfound, success }

class SureListViewModel extends ChangeNotifier {
  SureViewModel sureViewModel = SureViewModel([]);
  Status status = Status.initial;
  Future<void> getSureler() async {
    status = Status.loading;
    notifyListeners();
    List<String>? sureler = await KuranService().searchSure();
    notifyListeners();
    sureViewModel = SureViewModel(sureler!);
    notifyListeners();
    status = sureler.isNotEmpty ? Status.success : Status.notfound;
    notifyListeners();
  }
}
