import 'package:get/instance_manager.dart';

import 'package:get/get.dart';
import 'package:kuran_sure_meal_app/pages/dashboard/dashboardController.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}
