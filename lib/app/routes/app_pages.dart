import 'package:get/get.dart';

import '../modules/detail_character/bindings/detail_character_binding.dart';
import '../modules/detail_character/views/detail_character_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search_character/bindings/search_character_binding.dart';
import '../modules/search_character/views/search_character_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CHARACTER,
      page: () => const DetailCharacterView(),
      binding: DetailCharacterBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_CHARACTER,
      page: () => const SearchCharacterView(),
      binding: SearchCharacterBinding(),
    ),
  ];
}
