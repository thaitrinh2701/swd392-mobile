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
      body:
          mangas.isEmpty
              ? const Center(child: Text("No manga available"))
              : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: mangas.length,
                cacheExtent: 500, // Tăng hiệu suất cuộn
                itemBuilder: (context, index) {
                  final manga = mangas[index];
                  final String imageUrl = manga["cover_url"] ?? "";

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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: Stack(
                        children: [
                          // Ảnh nền với hiệu ứng blur
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              height: 180,
                              width: double.infinity,
                              placeholder:
                                  (context, url) => Container(
                                    height: 180,
                                    color: Colors.grey[300],
                                  ),
                              errorWidget:
                                  (context, url, error) => Container(
                                    height: 180,
                                    color: Colors.grey[400],
                                    child: const Icon(
                                      Icons.broken_image,
                                      size: 50,
                                    ),
                                  ),
                            ),
                          ),

                          // Lớp mờ
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                child: Container(
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),

                          // Nội dung chính
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Ảnh bìa chính
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    width: 110,
                                    height: 160,
                                    fit: BoxFit.cover,
                                    placeholder:
                                        (context, url) => Container(
                                          width: 110,
                                          height: 160,
                                          color: Colors.grey[300],
                                        ),
                                    errorWidget:
                                        (context, url, error) => const Icon(
                                          Icons.broken_image,
                                          size: 80,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 14),

                                // Thông tin truyện
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                    ),
                  );
                },
              ),
      backgroundColor: Colors.white,
    );
  }
}
