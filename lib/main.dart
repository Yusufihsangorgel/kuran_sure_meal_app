import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:kuran_sure_meal_app/pages/dashboard/dashboard.dart';
import 'package:kuran_sure_meal_app/pages/dashboard/dashboard_binding.dart';

import 'package:kuran_sure_meal_app/pages/home/homeScreen.dart';

void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const KuranApp());
}

class KuranApp extends StatelessWidget {
  const KuranApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
            name: '/', page: () => MyDashBoard(), binding: DashBoardBindings()),
      ],
    );
  }
}
