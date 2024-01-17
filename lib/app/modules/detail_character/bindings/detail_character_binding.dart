import 'package:get/get.dart';

import '../controllers/detail_character_controller.dart';

class DetailCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCharacterController>(
      () => DetailCharacterController(),
    );
  }
}
