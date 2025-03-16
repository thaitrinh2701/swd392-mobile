import 'package:flutter/material.dart';
import 'package:swd392_mobile/models/comics.dart';
import 'package:swd392_mobile/pages/manga_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allMangas = []; // Danh sách gốc từ API
  List<Map<String, dynamic>> filteredMangas = []; // Danh sách sau khi lọc
  bool isLoading = false; // Trạng thái tải dữ liệu
  bool hasSearched = false; // Kiểm tra xem có tìm kiếm chưa

  @override
  void initState() {
    super.initState();
    _fetchAllMangas(); // Load tất cả truyện một lần khi mở trang
  }

  Future<void> _fetchAllMangas() async {
    setState(() => isLoading = true);
    try {
      allMangas = await getAllManga(); // Lấy danh sách truyện từ API
    } catch (e) {
      print("Error fetching mangas: $e");
    }
    setState(() => isLoading = false);
  }

  void _filterMangas(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredMangas = [];
        hasSearched = false;
      });
      return;
    }

    setState(() {
      hasSearched = true;
      filteredMangas =
          allMangas
              .where(
                (manga) => manga["comic_name"]!.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Manga')),
      body: Column(
        children: [
          // Ô tìm kiếm
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search manga...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: _filterMangas, // Gợi ý ngay khi nhập
            ),
          ),
          // Hiển thị danh sách gợi ý
          Expanded(
            child:
                isLoading
                    ? const Center(
                      child: CircularProgressIndicator(),
                    ) // Đang tải
                    : filteredMangas.isEmpty && hasSearched
                    ? const Center(
                      child: Text("No manga found"),
                    ) // Không có kết quả
                    : ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: filteredMangas.length,
                      itemBuilder: (context, index) {
                        final manga = filteredMangas[index];
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              manga["cover_url"] ?? "",
                              width: 50,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image, size: 50),
                            ),
                          ),
                          title: Text(manga["comic_name"] ?? "Unknown"),
                          subtitle: Text(
                            manga["description"] ?? "No description available",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => MangaDetailPage(manga: manga),
                              ),
                            );
                          },
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
