import 'package:com_takehomechallenge_faris/app/data/models/character.dart';
import 'package:com_takehomechallenge_faris/app/modules/home/controllers/home_controller.dart';
import 'package:com_takehomechallenge_faris/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/search_character_controller.dart';

class SearchCharacterView extends GetView<SearchCharacterController> {
  const SearchCharacterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchCharacterView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Character',
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              controller: searchController,
              onChanged: (value) {
                homeController.searchCharacter(value);
              },
            ),
          ),
          Obx(
            () {
              final searchResults = homeController.searchResults;
              return Expanded(
                child: MasonryGridView.builder(
                  itemCount: searchResults.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    Character character = searchResults[index];
                    return GestureDetector(
                      onTap: () => Get.toNamed(Routes.DETAIL_CHARACTER,
                          arguments: character),
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(0.8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 180,
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.network(
                                  character.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
