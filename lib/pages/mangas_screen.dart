import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swd392_mobile/widgets/new_mangas_widget.dart';
import 'package:swd392_mobile/widgets/top_mangas_widget.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // TOP Manga - HIỆN TẠI là 4
            SizedBox(height: 350, child: TopMangaList()),

            SizedBox(height: 20),

            // Manga mới ra mắt
            SizedBox(height: 350, child: NewMangaList()),
          ],
        ),
      ),
    );
  }
}
