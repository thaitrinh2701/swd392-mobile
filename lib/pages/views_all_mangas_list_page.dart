import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui';

import 'manga_detail_page.dart';

class AllMangasListPage extends StatelessWidget {
  final String? title;
  final List<Map<String, String>> mangas;

  const AllMangasListPage({super.key, this.title, required this.mangas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
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
            child: Stack(
              children: [
                // Ảnh nền với hiệu ứng blur
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      // Ảnh nền
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              manga["cover_url"] ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Lớp mờ
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: ClipRRect(
                            // Đưa ClipRRect ra ngoài BackdropFilter
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                              child: const SizedBox.expand(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Nội dung chính
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ảnh bìa chính
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: manga["cover_url"] ?? "",
                          width: 110,
                          height: 160,
                          fit: BoxFit.cover,
                          errorWidget:
                              (context, url, error) => const Icon(
                                Icons.broken_image,
                                size: 80,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                      const SizedBox(width: 14),

                      // Thông tin truyện
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              manga["comic_name"] ?? "Unknown",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              manga["description"] ??
                                  "No description available",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
