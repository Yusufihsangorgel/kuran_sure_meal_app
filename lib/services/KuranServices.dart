import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kuran_sure_meal_app/models/Kuran_model.dart';

var dio = Dio();

Future<List<Product>> getKuranCode() async {
  var response = await dio.get("https://api.ubilisim.com/kuran/");
  for (var i = 0; i < 114; i++) {
    if (i == 0) {
      debugPrint(response.data["kuran"][""]["sureaditr"].toString());
    } else {
      debugPrint(response.data["kuran"]["$i"]["sureaditr"].toString());
    }
  }

  List<Product> _kuranList = [];
  if (response.statusCode == 200) {
    for (var i = 0; i < 114; i++) {
      if (i == 0) {
        _kuranList = (response.data["kuran"][""] as List)
            .map((e) => Product.fromJson(e))
            .toList();
      } else {
        _kuranList = (response.data["kuran"]["$i"] as List)
            .map((e) => Product.fromJson(e))
            .toList();
      }
    }
    return _kuranList;
  } else {
    debugPrint(response.statusMessage);
    return _kuranList;
  }
}

  /*Future<List<Postakodu>> getPostCode() async {
    var response = await dio.get("https://api.ubilisim.com/postakodu/il/34");
    debugPrint(response.data['postakodu'].toString());
    List<Postakodu> _postCodeList = [];
    if (response.statusCode == 200) {
      _postCodeList = (response.data['postakodu'] as List)
          .map((e) => Postakodu.fromJson(e))
          .toList();
    } else {
      debugPrint(response.statusMessage);
    }
    return _postCodeList;
  }
}*/
