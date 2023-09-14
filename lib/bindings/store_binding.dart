import 'package:exercise_app/controllers/detail_controller.dart';
import 'package:exercise_app/controllers/home_controller.dart';
import 'package:get/get.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DetailController());
    }
}