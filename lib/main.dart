import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuran_sure_meal_app/pages/dashboard/dashboard.dart';
import 'package:kuran_sure_meal_app/pages/dashboard/dashboard_binding.dart';
import 'package:kuran_sure_meal_app/pages/home/homeScreen.dart';

void main() {
  runApp(const KuranApp());
}

class KuranApp extends StatelessWidget {
  const KuranApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(
            name: '/', page: () => MyDashBoard(), binding: DashBoardBindings()),
      ],
    );
  }
}