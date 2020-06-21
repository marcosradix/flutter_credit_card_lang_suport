
import 'package:get/get.dart';


class BrandNameController extends GetController{
static BrandNameController get to => Get.find();
String brandName;
    void cleanForm() {
      update(this);
  }

}