import 'package:http/http.dart';
import 'package:kuran_sure_meal_app/models/Kuran_model.dart';
import 'package:kuran_sure_meal_app/services/Kuran_services.dart';
import 'package:mobx/mobx.dart';
part 'Kuran_view_model.g.dart';

class KuranViewModel = _KuranViewModelBase with _$KuranViewModel;

abstract class _KuranViewModelBase with Store {
  final errorMessage = "Beklenmedik bir hata oluştu";
  @observable
  List<Kuran> posts = [];

  @action
  getKuran() async {
    isLoadingToggle(false);
    try {
      isErrorToggle(false);
      final _KuranApi = KuranServices();

      posts = await _KuranApi.getKuran(sureLink);

      posts = await _KuranApi.getKuran(sureLink);

      isLoadingToggle(false);
    } catch (e) {
      isErrorToggle(true);
      Exception();
    }
  }

  @observable
  int sureLink = 0;

  /* @action
  void getSureLink(int getLink) {
    sureLink = getLink;
  }*/

  @observable
  bool getSure = false;

  @observable
  String sureAd = "";

  @action
  void addSureInput(String inputSure, int getLink) {
    if (sureAd != "") {
      sureAd = "";
      getSure = false;
      sureLink = 0;
      if (sureAd == "") {
        sureAd += inputSure;
        getSure = true;
        sureLink = getLink;
      }
      print(sureLink);
    } else {
      sureAd += inputSure;
      getSure = true;
      sureLink = getLink;
      print(sureLink);
    }
  }

  @observable
  bool isError = false;

  @action
  isErrorToggle(bool value) {
    isError = value;
  }

  @observable
  bool isLoading = false;

  @action
  isLoadingToggle(bool value) {
    isLoading = value;
  }
}
