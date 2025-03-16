import 'package:flutter/material.dart';

class MangaDetailPage extends StatelessWidget {
  final Map<String, String> manga;

  const MangaDetailPage({super.key, required this.manga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(manga["comic_name"] ?? "Manga Detail")),
      body: Center(
        child: Column(
          children: [
            if (manga["cover_url"] != null && manga["cover_url"]!.isNotEmpty)
              Image.network(
                manga["cover_url"]!,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 80),
              )
            else
              const Icon(Icons.broken_image, size: 80),
            const SizedBox(height: 10),
            Text(
              manga["comic_name"] ?? "Unknown",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(manga["description"] ?? "No description available"),
          ],
        ),
      ),
    );
  }
}
