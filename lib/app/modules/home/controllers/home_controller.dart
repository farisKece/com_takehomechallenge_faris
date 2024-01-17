import 'dart:convert';

import 'package:com_takehomechallenge_faris/app/data/models/character.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final isFavorite = false.obs;
  RxList<Character> listCharacter = <Character>[].obs;
  RxList<Character> searchResults = <Character>[].obs;

  Future<List<Character>> getAllCharacter() async {
    Uri uri = Uri.parse('https://rickandmortyapi.com/api/character');
    final res = await http.get(uri);

    List data = ((json.decode(res.body) as Map<String, dynamic>)['results']);

    if (data.isEmpty) {
      return [];
    } else {
      listCharacter.value = data.map((e) => Character.fromJson(e)).toList();
      return data.map((e) => Character.fromJson(e)).toList();
    }
  }

  List<Character> searchCharacter(String query) {
    searchResults.value = listCharacter
        .where((character) =>
            character.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return searchResults;
  }
}
