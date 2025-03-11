import 'package:flutter/material.dart';
import 'package:swd392_mobile/core/widgets/loader.dart';
import 'package:swd392_mobile/widgets/new_manga_slider.dart';
import 'package:swd392_mobile/widgets/top_manga_image_slider.dart';

class NewMangaList extends StatelessWidget {
  const NewMangaList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMangaByRankingTypeApi(rankingType: 'all', limit: 4),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.hasData) {
          final mangas = snapshot.data!;
          return NewMangaImageSlider(mangas: mangas);
        }

        return Text(snapshot.error.toString());
      },
    );
  }
}

Future<List<Map<String, String>>> getMangaByRankingTypeApi({
  required String rankingType,
  required int limit,
}) async {
  await Future.delayed(Duration(seconds: 1)); // Giả lập thời gian tải dữ liệu

  return [
    {
      "comic_id": "1",
      "comic_name": "Touhou Chireikiden: Hansoku Tantei Satori",
      "cover_url":
          "https://mangadex.org/covers/f4fa3679-6918-4684-bcb6-377c9f336898/31d5e78e-a8f2-44fd-b1b0-94828a4f7fd4.jpg",
      "user_id": "admin",
      "created_date": "2025-03-10",
      "quantity_chap": "15",
      "description": "A manga from the Touhou Project universe.",
      "status": "1",
    },
    {
      "comic_id": "2",
      "comic_name": "Lycoris Recoil",
      "cover_url":
          "https://mangadex.org/covers/9c21fbcd-e22e-4e6d-8258-7d580df9fc45/0184636a-f44c-4073-9b55-435120755e47.jpg",
      "user_id": "admin",
      "created_date": "2025-03-10",
      "quantity_chap": "20",
      "description": "An action-packed story about secret agents.",
      "status": "1",
    },
    {
      "comic_id": "3",
      "comic_name": "Houkago Bokura wa Uchuu ni Madou",
      "cover_url":
          "https://mangadex.org/covers/91a2e0c9-cd81-4bf7-b5f7-bb37434bf6b3/7a41b522-5383-422b-b6b4-fc2007f5c603.jpg",
      "user_id": "admin",
      "created_date": "2025-03-10",
      "quantity_chap": "10",
      "description": "A sci-fi romance manga.",
      "status": "1",
    },
    {
      "comic_id": "4",
      "comic_name": "Pocket Monsters: Liko's Treasure",
      "cover_url":
          "https://mangadex.org/covers/39c2752b-0d08-4bdc-8f99-4ac273fd194a/10f54e15-fda6-41c5-ae68-62d3de25dd71.jpg",
      "user_id": "admin",
      "created_date": "2025-03-10",
      "quantity_chap": "8",
      "description": "A Pokémon adventure story.",
      "status": "1",
    },
  ];
}
