import 'package:com_takehomechallenge_faris/app/data/models/character.dart';
import 'package:com_takehomechallenge_faris/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.SEARCH_CHARACTER);
          },
          icon: const Icon(
            Iconsax.search_favorite,
            size: 20,
          ),
        ),
      ),
      body: FutureBuilder<List<Character>>(
        future: controller.getAllCharacter(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('Maaf Gak Ada Data :)'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: MasonryGridView.builder(
                  itemCount: snapshot.data!.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    Character character = snapshot.data![index];
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
                              Stack(
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
                                  Positioned(
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.grey[200]?.withOpacity(0.8),
                                      child: IconButton(
                                        icon: Icon(
                                          controller.isFavorite.value
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: controller.isFavorite.value
                                              ? Colors.red
                                              : null,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
