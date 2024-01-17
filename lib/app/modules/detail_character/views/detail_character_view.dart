import 'package:com_takehomechallenge_faris/app/data/models/character.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_character_controller.dart';

class DetailCharacterView extends GetView<DetailCharacterController> {
  const DetailCharacterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Character chara = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(chara.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: Get.height * .25,
                  width: Get.width * .35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(chara.image), fit: BoxFit.cover),
                    color: Colors.amber,
                  ),
                ),
              ),
              Expanded(
                // Tambahkan Expanded untuk mengisi ruang yang tersisa
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Teks sejajar kiri
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Name: ${chara.name}',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'Species: ${chara.species}',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'Gender: ${chara.gender}',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'Origin: ${chara.origin.name}',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      'Location: ${chara.location.name}',
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
