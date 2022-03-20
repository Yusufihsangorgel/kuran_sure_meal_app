import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kuran_sure_meal_app/models/Kuran_model.dart';

var dio = Dio();

class KuranService {
  Future<List<String>?> searchSure() async {
    Uri url = Uri.parse('https://api.ubilisim.com/kuran/');
    final response = await dio.get(url.toString());

    if (response.statusCode == 200) {
      final result = json.decode(response.data);
      if (result[0] != null) {
        KuranResponse kuranResponse = KuranResponse.fromJson(result[0]);
        List<String> sureler = [];
        for (KuranList sureAd in kuranResponse.kuranList!) {
          sureler.add(sureAd.sureAd!);
        }
        return sureler;
      }
    }
    throw Exception('Bad request');
  }
}
