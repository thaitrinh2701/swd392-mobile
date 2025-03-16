import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swd392_mobile/widgets/manga_list.dart';
import 'package:swd392_mobile/widgets/weekly_top.dart';
import 'package:swd392_mobile/widgets/monthly_top.dart';
import 'package:swd392_mobile/widgets/top_mangas_widget.dart';
import 'package:swd392_mobile/models/manga.dart'; // Import file chứa getTopMangaOfWeek

class MangasScreen extends StatefulWidget {
  const MangasScreen({super.key});

  @override
  State<MangasScreen> createState() => _MangasScreenState();
}

class _MangasScreenState extends State<MangasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rookies Comic'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP Manga - HIỆN TẠI là 4
            const SizedBox(height: 350, child: TopMangaList()),

            const SizedBox(height: 30),

            // Manga vừa updated - 4 manga
            SizedBox(
              height: 240,
              child: MangaList(
                fetchManga: () => getTopMangaOfWeek(limit: 4),
                title: "Comics of the Week",
              ),
            ),

            SizedBox(
              height: 240,
              child: MangaList(
                fetchManga: () => getTopMangaOfMonth(limit: 4),
                title: "Comics of the Month",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
