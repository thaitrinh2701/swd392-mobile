import 'package:flutter/material.dart';
import 'package:swd392_mobile/models/comics.dart';
import 'package:swd392_mobile/pages/views_all_mangas_list_page.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> categories = [
    "Action",
    "Comedy",
    "Mystery",
    "Sci-fi",
    "Adventure",
    "Romance",
    "Sports",
  ];

  late String selectedCategory;
  List<Map<String, String>> mangaList = [];

  @override
  void initState() {
    super.initState();
    selectedCategory = categories[0];
    _fetchMangaList(selectedCategory);
  }

  Future<void> _fetchMangaList(String genre) async {
    if (!mounted) return;

    setState(() {
      selectedCategory = genre;
      mangaList = [];
    });

    List<Map<String, String>> mangas = await getMangaByGenre(
      genre: genre,
      limit: 10,
    );

    if (!mounted) return;

    setState(() {
      mangaList = mangas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Categories"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Thanh cuộn chọn thể loại
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category;

                    return GestureDetector(
                      onTap: () => _fetchMangaList(category),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? Colors.blueAccent : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                          gradient:
                              isSelected
                                  ? const LinearGradient(
                                    colors: [Colors.blue, Colors.pink],
                                  )
                                  : null,
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Hiển thị danh sách manga trong AllMangasListPage
            Expanded(
              child: Container(
                color: Colors.white,
                child: AllMangasListPage(title: null, mangas: mangaList),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
