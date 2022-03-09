class Sure {
  String? ayetID;
  String? suretur;
  String? surear;
  String? sureen;

  Sure({this.ayetID, this.suretur, this.surear, this.sureen});

  Sure.fromJson(Map<String, dynamic> json) {
    ayetID = json['ayetID'];
    suretur = json['suretur'];
    surear = json['surear'];
    sureen = json['sureen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ayetID'] = this.ayetID;
    data['suretur'] = this.suretur;
    data['surear'] = this.surear;
    data['sureen'] = this.sureen;
    return data;
  }
}
