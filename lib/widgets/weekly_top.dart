// import 'package:flutter/material.dart';
// import 'package:swd392_mobile/core/widgets/loader.dart';
// import 'package:swd392_mobile/models/manga.dart';
// import 'package:swd392_mobile/widgets/slider.dart';

// class FeatureMangaList extends StatelessWidget {
//   const FeatureMangaList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getTopMangaOfWeek(limit: 5), // Thay đổi hàm gọi dữ liệu
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Loader();
//         }

//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }

//         if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Text("No comics available this week.");
//         }

//         final mangas = snapshot.data!;
//         return NewMangaImageSlider(mangas: mangas, title: "Comics of the Week");
//       },
//     );
//   }
// }
