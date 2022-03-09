import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kuran_sure_meal_app/models/sureModel.dart';

var dio = Dio();

Future<List<Sure>?> getSureCode() async {
  var response = await dio.get("https://api.ubilisim.com//kuran//sure//1");

  debugPrint(response.data['sure'].toString());
  List<Sure> _sureList = [];
  if (response.statusCode == 200) {
    _sureList =
        (response.data['sure'] as List).map((e) => Sure.fromJson(e)).toList();
    return _sureList;
  } else {
    debugPrint(response.statusMessage);
    return null;
  }
}
