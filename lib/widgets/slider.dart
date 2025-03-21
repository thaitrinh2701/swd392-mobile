import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:swd392_mobile/pages/views_all_mangas_list_page.dart';

class MangaSlider extends StatefulWidget {
  final List<Map<String, String>> mangas;
  final String title;
  final Function(Map<String, String>) onTapManga;

  const MangaSlider({
    super.key,
    required this.mangas,
    required this.title,
    required this.onTapManga, // Nhận callback onTapManga
  });

  @override
  State<MangaSlider> createState() => _MangaSliderState();
}

class _MangaSliderState extends State<MangaSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              estureDetector(
                onTap: () {
                  if (widget.mangas.isNotEmpty) {
                    if (!mounted) return; // Fix lỗi mất context
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AllMangasListPage(
                              title: widget.title ?? "All Mangas",
                              mangas: widget.mangas,
                            ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No manga available")),
                    );
                  }
                },
                child: const Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4D4FC1),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: widget.mangas.length,
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 0.4,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final manga = widget.mangas[index];
            return GestureDetector(
              onTap:
                  () => widget.onTapManga(
                    manga,
                  ), // Gọi hàm onTapManga khi nhấn vào
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      manga["cover_url"] ?? "",
                      fit: BoxFit.cover,
                      width: 120,
                      height: 160,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 80),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    (manga["comic_name"]?.length ?? 0) > 20
                        ? "${manga["comic_name"]!.substring(0, 20)}..."
                        : manga["comic_name"] ?? "Unknown",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
