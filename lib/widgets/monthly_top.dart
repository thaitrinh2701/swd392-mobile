// import 'package:flutter/material.dart';
// import 'package:swd392_mobile/core/widgets/loader.dart';
// import 'package:swd392_mobile/models/manga.dart';
// import 'package:swd392_mobile/widgets/slider.dart';
// import 'package:swd392_mobile/widgets/top_manga_image_slider.dart';

// class NewMangaList extends StatelessWidget {
//   const NewMangaList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getTopMangaOfMonth(limit: 4),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Loader();
//         }

//         if (snapshot.hasData) {
//           final mangas = snapshot.data!;
//           return NewMangaImageSlider(
//             mangas: mangas,
//             title: "Comics of the Month",
//           );
//         }

//         return Text(snapshot.error.toString());
//       },
//     );
//   }
// }
