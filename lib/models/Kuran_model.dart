class Kuran {
  final String ayetId;
  final String suretur;
  final String surear;
  final String sureen;
  Kuran({
    required this.ayetId,
    required this.suretur,
    required this.surear,
    required this.sureen,
  });

  factory Kuran.fromJson(Map<String, dynamic> json) => Kuran(
        ayetId: json["ayetID"],
        suretur: json["suretur"],
        surear: json["surear"],
        sureen: json["sureen"],
      );
}
