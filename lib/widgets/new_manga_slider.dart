import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewMangaImageSlider extends StatefulWidget {
  final List<Map<String, String>> mangas;

  const NewMangaImageSlider({super.key, required this.mangas});

  @override
  State<NewMangaImageSlider> createState() => _NewMangaImageSliderState();
}

class _NewMangaImageSliderState extends State<NewMangaImageSlider> {
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
                "Latest Updates",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LatestUpdatesPage(),
                    ),
                  );
                },
                child: Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
            return Column(
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
                      ? manga["comic_name"]!.substring(0, 20) + "..."
                      : manga["comic_name"] ?? "Unknown",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class LatestUpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latest Updates")),
      body: Center(child: Text("This is the Latest Updates page.")),
    );
  }
}
