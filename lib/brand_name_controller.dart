import 'package:get/get.dart';

class BrandNameController extends GetxController {
  static BrandNameController get to => Get.find();
  String brandName;
  void cleanForm() {
    update();
  }
}
