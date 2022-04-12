import 'package:get/get.dart';
import 'package:owlnime/screens/details/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}
