import 'package:get/get.dart';

import '../controllers/search_character_controller.dart';

class SearchCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchCharacterController>(
      () => SearchCharacterController(),
    );
  }
}
