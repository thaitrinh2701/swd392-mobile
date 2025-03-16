import 'package:flutter/material.dart';
import 'package:swd392_mobile/core/widgets/loader.dart';
import 'package:swd392_mobile/widgets/slider.dart';

class MangaList extends StatelessWidget {
  final Future<List<Map<String, String>>> Function() fetchManga;
  final String title;

  const MangaList({super.key, required this.fetchManga, required this.title});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: fetchManga(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("No comics available.");
        }

        final mangas = snapshot.data!;
        return MangaSlider(mangas: mangas, title: title);
      },
    );
  }
}
