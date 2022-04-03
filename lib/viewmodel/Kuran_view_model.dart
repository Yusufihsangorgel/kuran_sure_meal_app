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
    try {
      isErrorToggle(false);
      isLoadingToggle(false);
      final _KuranApi = KuranServices();

      posts = await _KuranApi.getKuran(sureLink);

      posts = await _KuranApi.getKuran(sureLink);

      getSure = true;
      print("girdi kanka aha getsure $getSure");
    } catch (e) {
      isErrorToggle(true);
      Exception();
    }
  }

  @observable
  bool turkish = true;

  @observable
  bool english = false;

  @action
  getTurkish() {
    turkish = true;
    english = false;
    print("turkish $turkish");
  }

  @action
  getEnglish() {
    english = true;
    turkish = false;
    print("english $english");
  }

  @observable
  int sureLink = 0;

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
        getSure = true;
        sureAd += inputSure;

        sureLink = getLink;
      }
      print(sureLink);
    } else {
      getKuran();

      getSure = true;
      sureAd += inputSure;

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
  bool isLoading = true;

  @action
  isLoadingToggle(bool value) {
    isLoading = value;
  }
}
