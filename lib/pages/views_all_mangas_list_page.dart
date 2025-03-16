import 'package:flutter/material.dart';
import 'manga_detail_page.dart'; // Import trang chi tiết manga

class AllMangasListPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> mangas;

  const AllMangasListPage({
    super.key,
    required this.title,
    required this.mangas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: mangas.length,
        itemBuilder: (context, index) {
          final manga = mangas[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MangaDetailPage(manga: manga),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(51),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ĐIỀU CHỈNH KÍCH THƯỚC ẢNH
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      manga["cover_url"] ?? "",
                      width: 120,
                      height: 160,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 80),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // THÔNG TIN HIỂN THỊ TRONG LIST
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          manga["comic_name"] ?? "Unknown",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          manga["description"] ?? "No description available",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
