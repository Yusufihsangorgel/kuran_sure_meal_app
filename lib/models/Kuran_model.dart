class KuranResponse {
  List<KuranList>? kuranList;
  KuranResponse({this.kuranList});
  KuranResponse.fromJson(Map<String, dynamic> json) {
    if (json['kuran'] != null) {
      kuranList = [];
      json['kuran'].forEach((a) => kuranList!.add(KuranList.fromJson(a)));
    }
  }
}

class KuranList {
  String? sureRakam;
  String? sureAd;

  KuranList({this.sureAd, this.sureRakam});
  KuranList.fromJson(Map<String, dynamic> json) {
    for (var i = 0; i < 114; i++) {
      if (i == 0) {
        sureAd = json['']['sureaditr'];
      } else {
        sureAd = json['$i']['sureaditr'];
      }
    }
  }
}
