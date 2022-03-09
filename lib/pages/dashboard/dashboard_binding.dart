import 'package:get/instance_manager.dart';

import 'package:get/get.dart';
import 'package:kuran_sure_meal_app/pages/dashboard/dashboardController.dart';
import 'package:kuran_sure_meal_app/pages/home/homeController.dart';
import 'package:kuran_sure_meal_app/pages/read/readController.dart';
import 'package:kuran_sure_meal_app/pages/search/searchController.dart';

import 'package:kuran_sure_meal_app/pages/settings/settingsController.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<ReadController>(() => ReadController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
