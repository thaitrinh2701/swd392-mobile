import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MangaDetailPage extends StatefulWidget {
  final Map<String, dynamic> manga;

  const MangaDetailPage({super.key, required this.manga});

  @override
  _MangaDetailPageState createState() => _MangaDetailPageState();
}

class _MangaDetailPageState extends State<MangaDetailPage> {
  bool showFullDescription = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    // Get the number of chapters from manga data
    final int quantityChap =
        int.tryParse(widget.manga['quantity_chap']?.toString() ?? '0') ?? 0;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: widget.manga['cover_url']!,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.broken_image, size: 80),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: widget.manga['cover_url']!,
                              width: 100,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.manga['comic_name']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Người đăng: ${widget.manga['user_id']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Lượt xem: ${widget.manga['view']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Ngày đăng: ${widget.manga['created_date']}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              icon: const Icon(Icons.menu_book),
                              label: const Text("Đọc truyện"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'report') {
                                // Xử lý báo cáo
                              }
                            },
                            itemBuilder:
                                (context) => [
                                  const PopupMenuItem(
                                    value: 'report',
                                    child: Text('Báo cáo'),
                                  ),
                                ],
                            child: const Icon(Icons.more_vert, size: 28),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              size: 28,
                              color:
                                  isSaved
                                      ? const Color(0xFF4D4FC1)
                                      : Colors.transparent,
                            ),
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Color(0xFF4D4FC1),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isSaved = !isSaved;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          showFullDescription
                              ? widget.manga['description']!
                              : (widget.manga['description']!.length > 150
                                  ? '${widget.manga['description']!.substring(0, 150)}...'
                                  : widget.manga['description']!),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      if (widget.manga['description']!.length > 150)
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showFullDescription = !showFullDescription;
                              });
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF4D4FC1),
                            ),
                            child: Text(
                              showFullDescription ? "Thu gọn" : "Xem thêm",
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Chapter section header
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Chapters",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "($quantityChap)",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // Chapter list
                Expanded(
                  child: ListView.builder(
                    itemCount: quantityChap > 0 ? quantityChap : 0,
                    itemBuilder: (context, index) {
                      // Chapter number (descending order by default)
                      final int chapterNumber = quantityChap - index;

                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Chapter title
                            Text(
                              "Chapter $chapterNumber",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),

                            // Arrow icon
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
