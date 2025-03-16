import 'package:flutter/material.dart';
import 'package:swd392_mobile/models/comics.dart';
import 'package:swd392_mobile/pages/search_screen.dart';
import 'package:swd392_mobile/widgets/manga_list.dart';
import 'package:swd392_mobile/widgets/top_mangas_widget.dart';
import 'package:swd392_mobile/pages/manga_detail_page.dart';

class MangasScreen extends StatefulWidget {
  const MangasScreen({super.key});

  @override
  State<MangasScreen> createState() => _MangasScreenState();
}

class _MangasScreenState extends State<MangasScreen> {
  void _navigateToDetail(Map<String, String> manga) {
    if (!mounted) return;
    if (manga.isEmpty) {
      print("Error: Manga data is empty!");
      return;
    }

    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MangaDetailPage(manga: manga),
          ),
        )
        .then((_) {
          print("Returned from detail page");
        })
        .catchError((e) {
          print("Navigation error: $e");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rookies Comic'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 350, child: TopMangaList()),

            const SizedBox(height: 30),

            SizedBox(
              height: 240,
              child: MangaList(
                fetchManga: () => getTopMangaOfWeek(limit: 4),
                title: "Comics of the Week",
                onTapManga: _navigateToDetail,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              height: 240,
              child: MangaList(
                fetchManga: () => getTopMangaOfMonth(limit: 4),
                title: "Comics of the Month",
                onTapManga: _navigateToDetail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
