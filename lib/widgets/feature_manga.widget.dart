import 'package:flutter/material.dart';
import 'package:swd392_mobile/core/widgets/loader.dart';
import 'package:swd392_mobile/widgets/new_manga_slider.dart';

class FeatureMangaList extends StatelessWidget {
  const FeatureMangaList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFeaturedMangas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.hasData) {
          final mangas = snapshot.data!;
          return NewMangaImageSlider(mangas: mangas, title: "Featured");
        }

        return Text(snapshot.error.toString());
      },
    );
  }
}

Future<List<Map<String, String>>> getFeaturedMangas() async {
  await Future.delayed(Duration(seconds: 1)); // Giả lập thời gian tải dữ liệu

  return [
    {
      "comic_id": "1",
      "comic_name": "Re:Zero - Daigoshou: Mizu no Miyako to Eiyuu no Uta",
      "cover_url":
          "https://mangadex.org/covers/fa0fb27a-d1db-4826-b400-fa3375468353/149f44de-ee95-46de-9a94-aa50a43d6de8.jpg",
      "description": "A new chapter in the Re:Zero saga!",
    },
    {
      "comic_id": "2",
      "comic_name": "Neko Oji Salaryman - Reincarnated as a Kitten",
      "cover_url":
          "https://mangadex.org/covers/642bf922-094b-4a98-b0b7-8d6add31b729/6f87bf16-6b1e-4ed0-9e83-19f61239706f.jpg",
      "description": "A salaryman reincarnated... as a cat?!",
    },
    {
      "comic_id": "3",
      "comic_name": "Blue Lock",
      "cover_url":
          "https://mangadex.org/covers/4141c5dc-c525-4df5-afd7-cc7d192a832f/1666c0dc-cf08-4a87-94b6-eec22460d0f6.jpg",
      "description": "The ultimate soccer battle begins!",
    },
    {
      "comic_id": "4",
      "comic_name": "Nageki no Bourei wa Intai Shitai",
      "cover_url":
          "https://mangadex.org/covers/e0c6cde1-232e-45de-8e0d-b6902c1453d0/38588b37-e778-489c-b2df-dd9e411c8c39.jpg",
      "description": "A legendary hunter's journey of retirement... or not?!",
    },
    {
      "comic_id": "5",
      "comic_name": "Doraemon",
      "cover_url":
          "https://mangadex.org/title/e36da8b0-feca-46dd-9120-d5dc2f3feae8/doraemon",
      "description": "The adventures of a time-traveling robotic cat!",
    },
    {
      "comic_id": "6",
      "comic_name": "Crayon Shin-chan",
      "cover_url":
          "https://mangadex.org/covers/8e6b0382-49d7-4131-8f4b-2e4df8a38102/e0e1c1d1-d429-49e1-9f8e-80359751295f.jpg",
      "description": "The mischievous adventures of little Shin-chan!",
    },
  ];
}
