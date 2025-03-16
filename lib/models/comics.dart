class Manga {
  final String comicId;
  final String comicName;
  final String coverUrl;
  final String userId;
  final DateTime createdDate;
  final int quantityChap;
  final String description;
  final int status;
  final int view;
  final String genresId;

  Manga({
    required this.comicId,
    required this.comicName,
    required this.coverUrl,
    required this.userId,
    required this.createdDate,
    required this.quantityChap,
    required this.description,
    required this.status,
    required this.view,
    required this.genresId,
  });

  // Convert JSON sang object
  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
      comicId: json["comic_id"],
      comicName: json["comic_name"],
      coverUrl: json["cover_url"],
      userId: json["user_id"],
      createdDate: DateTime.parse(json["created_date"]),
      quantityChap: int.parse(json["quantity_chap"].toString()),
      description: json["description"],
      status: int.parse(json["status"].toString()),
      view: int.parse(json["view"].toString()),
      genresId: json["genres_id"],
    );
  }

  // Convert object sang JSON
  Map<String, dynamic> toJson() {
    return {
      "comic_id": comicId,
      "comic_name": comicName,
      "cover_url": coverUrl,
      "user_id": userId,
      "created_date": createdDate.toIso8601String(),
      "quantity_chap": quantityChap,
      "description": description,
      "status": status,
      "view": view,
      "genres_id": genresId,
    };
  }
}

Future<List<Map<String, dynamic>>> getAllManga() async {
  await Future.delayed(Duration(seconds: 1)); // Giả lập tải dữ liệu

  return [
    {
      "comic_id": "1",
      "comic_name": "Cyberpunk Edgerunners",
      "cover_url":
          "https://mangadex.org/covers/832692d3-11c7-49a1-aca4-deabdcf9e996/5f48bd6a-f0bf-4b89-91b3-59ff3bc0e5c2.jpg",
      "user_id": "admin",
      "created_date": DateTime(2025, 3, 12),
      "quantity_chap": 12,
      "description": "A cyberpunk world full of action.",
      "status": 1,
      "view": 7000,
      "genres_id": "action",
    },
    {
      "comic_id": "2",
      "comic_name": "Spy x Family",
      "cover_url":
          "https://mangadex.org/covers/6b958848-c885-4735-9201-12ee77abcb3c/d8babd13-5736-4964-8963-b444a950d539.jpg",
      "user_id": "admin",
      "created_date": DateTime(2025, 3, 13),
      "quantity_chap": 25,
      "description": "A spy comedy manga.",
      "status": 1,
      "view": 5000,
      "genres_id": "comedy",
    },
    {
      "comic_id": "3",
      "comic_name": "Touhou Chireikiden: Hansoku Tantei Satori",
      "cover_url":
          "https://mangadex.org/covers/f4fa3679-6918-4684-bcb6-377c9f336898/31d5e78e-a8f2-44fd-b1b0-94828a4f7fd4.jpg",
      "user_id": "admin",
      "created_date": DateTime(2025, 3, 14),
      "quantity_chap": 15,
      "description": "A manga from the Touhou Project universe.",
      "status": 1,
      "view": 6500,
      "genres_id": "mystery",
    },
    {
      "comic_id": "4",
      "comic_name": "Lycoris Recoil",
      "cover_url":
          "https://mangadex.org/covers/9c21fbcd-e22e-4e6d-8258-7d580df9fc45/0184636a-f44c-4073-9b55-435120755e47.jpg",
      "user_id": "admin",
      "created_date": DateTime(2025, 3, 15),
      "quantity_chap": 20,
      "description":
          "Takina Inoue, a high school girl working as a member of an all-female taskforce of assassins and spies known as \"Lycoris\" dispatched to eliminate criminals and terrorists in Tokyo, is sanctioned by her superiors at the DA agency for disobeying orders in order to save a colleague. She is transferred to work with the elite Lycoris agent Chisato Nishikigi at one of the agency's branches, which operates under the cover of a cafe, called LycoReco.",
      "status": 1,
      "view": 7200,
      "genres_id": "action",
    },
    {
      "comic_id": "5",
      "comic_name": "Houkago Bokura wa Uchuu ni Madou",
      "cover_url":
          "https://mangadex.org/covers/91a2e0c9-cd81-4bf7-b5f7-bb37434bf6b3/7a41b522-5383-422b-b6b4-fc2007f5c603.jpg",
      "user_id": "admin",
      "created_date": DateTime(2025, 3, 10),
      "quantity_chap": 10,
      "description": "A sci-fi romance manga.",
      "status": 1,
      "view": 4800,
      "genres_id": "sci-fi",
    },
    {
      "comic_id": "6",
      "comic_name": "Pocket Monsters: Liko's Treasure",
      "cover_url":
          "https://mangadex.org/covers/39c2752b-0d08-4bdc-8f99-4ac273fd194a/10f54e15-fda6-41c5-ae68-62d3de25dd71.jpg",
      "user_id": "admin",
      "created_date": DateTime(2025, 3, 10),
      "quantity_chap": 8,
      "description": "A Pokémon adventure story.",
      "status": 1,
      "view": 5300,
      "genres_id": "adventure",
    },
    {
      "comic_id": "7",
      "comic_name": "Attack on Titan",
      "cover_url":
          "https://mangadex.org/covers/304ceac3-8cdb-4fe7-acf7-2b6ff7a60613/29f82b1d-b37f-455a-b630-e42bccb1422a.jpg",
      "user_id": "admin",
      "created_date": DateTime(2025, 2, 28),
      "quantity_chap": 139,
      "description": "A post-apocalyptic battle for survival.",
      "status": 1,
      "view": 20000,
      "genres_id": "action",
    },
    {
      "comic_id": "8",
      "comic_name": "One Piece",
      "cover_url":
          "https://mangadex.org/covers/a1c7c817-4e59-43b7-9365-09675a149a6f/249fa95b-2214-4ae3-a8f7-77338fe34542.png",
      "user_id": "admin",
      "created_date": DateTime(2025, 2, 20),
      "quantity_chap": 1100,
      "description": "A grand pirate adventure.",
      "status": 1,
      "view": 50000,
      "genres_id": "adventure",
    },
    {
      "comic_id": "9",
      "comic_name": "Your Name",
      "cover_url":
          "https://mangadex.org/covers/c071276e-abd4-4711-8b14-544431eb152a/d6860e8a-d13e-49d8-a6ad-1fa87f937a7a.jpg",
      "user_id": "admin",
      "created_date": DateTime(2024, 12, 20),
      "quantity_chap": 10,
      "description": "A romance fantasy story.",
      "status": 1,
      "view": 15000,
      "genres_id": "romance",
    },
    {
      "comic_id": "10",
      "comic_name": "Blue Lock",
      "cover_url":
          "https://mangadex.org/covers/4141c5dc-c525-4df5-afd7-cc7d192a832f/92943ee9-92c3-43f9-96e2-d73515ace108.jpg",
      "user_id": "admin",
      "created_date": DateTime(2025, 3, 15),
      "quantity_chap": 30,
      "description": "A high-stakes football competition.",
      "status": 1,
      "view": 18000,
      "genres_id": "sports",
    },
  ];
}

// **Lấy top truyện theo tuần (7 ngày)**
Future<List<Map<String, String>>> getTopMangaOfWeek({
  required int limit,
}) async {
  List<Map<String, dynamic>> allManga = await getAllManga();
  DateTime now = DateTime.now();
  DateTime oneWeekAgo = now.subtract(Duration(days: 7));

  List<Map<String, dynamic>> filteredManga =
      allManga
          .where((manga) => manga["created_date"].isAfter(oneWeekAgo))
          .toList()
        ..sort((a, b) => b["view"].compareTo(a["view"]));

  return filteredManga
      .take(limit)
      .map(
        (manga) => manga.map((key, value) => MapEntry(key, value.toString())),
      )
      .toList();
}

// **Lấy top truyện theo tháng (30 ngày)**
Future<List<Map<String, String>>> getTopMangaOfMonth({
  required int limit,
}) async {
  List<Map<String, dynamic>> allManga = await getAllManga();
  DateTime now = DateTime.now();
  DateTime oneMonthAgo = now.subtract(Duration(days: 30));

  List<Map<String, dynamic>> filteredManga =
      allManga
          .where((manga) => manga["created_date"].isAfter(oneMonthAgo))
          .toList()
        ..sort((a, b) => b["view"].compareTo(a["view"]));

  return filteredManga
      .take(limit)
      .map(
        (manga) => manga.map((key, value) => MapEntry(key, value.toString())),
      )
      .toList();
}

// **Lấy truyện theo thể loại**
Future<List<Map<String, String>>> getMangaByGenre({
  required String genre,
  required int limit,
}) async {
  List<Map<String, dynamic>> allManga = await getAllManga();

  List<Map<String, dynamic>> filteredManga =
      allManga
          .where(
            (manga) => manga["genres_id"].toLowerCase() == genre.toLowerCase(),
          )
          .toList()
        ..sort((a, b) => b["view"].compareTo(a["view"]));

  return filteredManga
      .take(limit)
      .map(
        (manga) => manga.map((key, value) => MapEntry(key, value.toString())),
      )
      .toList();
}

Future<List<Map<String, String>>> getFeatureManga({
  required String rankingType,
  required int limit,
}) async {
  await Future.delayed(Duration(seconds: 1)); // Giả lập thời gian tải dữ liệu

  List<Map<String, String>> data = [
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

  return data.take(limit).toList();
}

// Future<List<Map<String, String>>> getFeatureManga({
//   required String rankingType,
//   required int limit,
// }) async {
//   await Future.delayed(Duration(seconds: 1)); // Giả lập thời gian tải dữ liệu

//   List<Map<String, dynamic>> data = [
//     {
//       "comic_id": "1",
//       "comic_name": "Touhou Chireikiden: Hansoku Tantei Satori",
//       "cover_url":
//           "https://mangadex.org/covers/f4fa3679-6918-4684-bcb6-377c9f336898/31d5e78e-a8f2-44fd-b1b0-94828a4f7fd4.jpg",
//       "user_id": "admin",
//       "created_date": "2025-03-10",
//       "quantity_chap": "15",
//       "description": "A manga from the Touhou Project universe.",
//       "status": "1",
//       "category": "week",
//     },
//     {
//       "comic_id": "2",
//       "comic_name": "Lycoris Recoil",
//       "cover_url":
//           "https://mangadex.org/covers/9c21fbcd-e22e-4e6d-8258-7d580df9fc45/0184636a-f44c-4073-9b55-435120755e47.jpg",
//       "user_id": "admin",
//       "created_date": "2025-03-10",
//       "quantity_chap": "20",
//       "description": "An action-packed story about secret agents.",
//       "status": "1",
//       "category": "week",
//     },
//     {
//       "comic_id": "3",
//       "comic_name": "Houkago Bokura wa Uchuu ni Madou",
//       "cover_url":
//           "https://mangadex.org/covers/91a2e0c9-cd81-4bf7-b5f7-bb37434bf6b3/7a41b522-5383-422b-b6b4-fc2007f5c603.jpg",
//       "user_id": "admin",
//       "created_date": "2025-03-10",
//       "quantity_chap": "10",
//       "description": "A sci-fi romance manga.",
//       "status": "1",
//       "category": "month",
//     },
//     {
//       "comic_id": "4",
//       "comic_name": "Pocket Monsters: Liko's Treasure",
//       "cover_url":
//           "https://mangadex.org/covers/39c2752b-0d08-4bdc-8f99-4ac273fd194a/10f54e15-fda6-41c5-ae68-62d3de25dd71.jpg",
//       "user_id": "admin",
//       "created_date": "2025-03-10",
//       "quantity_chap": "8",
//       "description": "A Pokémon adventure story.",
//       "status": "1",
//       "category": "month",
//     },
//   ];

//   // Lọc theo rankingType (week hoặc month)
//   List<Map<String, dynamic>> filteredData =
//       data.where((manga) => manga["category"] == rankingType).toList();

//   // Giới hạn số lượng theo limit
//   List<Map<String, String>> result =
//       filteredData
//           .take(limit)
//           .map(
//             (manga) =>
//                 manga.map((key, value) => MapEntry(key, value.toString())),
//           )
//           .toList();

//   return result;
// }
