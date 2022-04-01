import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kuran_sure_meal_app/models/Kuran_model.dart';

class KuranServices {
  Future<List<Kuran>> getKuran(int link) async {
    final baseUrl = 'https://api.ubilisim.com//kuran//sure//$link';
    final response = await http.get(Uri.parse(baseUrl));
    final jsonFirst = jsonDecode(response.body);
    final jsonSecond = jsonFirst["sure"] as List;
    debugPrint(jsonSecond.toString());
    final posts = jsonSecond.map((e) => Kuran.fromJson(e)).toList();

    return posts;
  }
}
