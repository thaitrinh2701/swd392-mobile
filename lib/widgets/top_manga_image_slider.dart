import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopMangaImageSlider extends StatefulWidget {
  final List<Map<String, String>> mangas;

  const TopMangaImageSlider({super.key, required this.mangas});

  @override
  State<TopMangaImageSlider> createState() => _TopMangaImageSliderState();
}

class _TopMangaImageSliderState extends State<TopMangaImageSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child:
              widget.mangas.isNotEmpty
                  ? ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Image.network(
                      widget.mangas[_currentIndex]["cover_url"] ?? "",
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 80),
                    ),
                  )
                  : Container(),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3), // Tăng độ trong suốt
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items:
                    widget.mangas.map((manga) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          manga["cover_url"] ?? "",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 80),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: widget.mangas.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotHeight: 8.0,
                dotWidth: 8.0,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
