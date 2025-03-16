// class Chapter {
//   final String chapterId;
//   final String chapterName;
//   final String comicId;
//   final DateTime publishedDate;
//   final String description;
//   final int status;
//   final int type;
//   // final List<Comment> comments;
//   // final List<ChapterImage> chapterImages;

//   Chapter({
//     required this.chapterId,
//     required this.chapterName,
//     required this.comicId,
//     required this.publishedDate,
//     required this.description,
//     required this.status,
//     required this.type,
//     this.comments = const [],
//     this.chapterImages = const [],
//   });

//   factory Chapter.fromJson(Map<String, dynamic> json) {
//     return Chapter(
//       chapterId: json["chapter_id"] ?? "",
//       chapterName: json["chapter_name"] ?? "",
//       comicId: json["comic_id"] ?? "",
//       publishedDate:
//           json["published_date"] != null
//               ? DateTime.parse(json["published_date"])
//               : DateTime.now(),
//       description: json["description"] ?? "",
//       status: json["status"] ?? 0,
//       type: json["type"] ?? 0,
//       comments:
//           (json["comments"] as List?)
//               ?.map((e) => Comment.fromJson(e))
//               .toList() ??
//           [],
//       chapterImages:
//           (json["chapter_images"] as List?)
//               ?.map((e) => ChapterImage.fromJson(e))
//               .toList() ??
//           [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "chapter_id": chapterId,
//       "chapter_name": chapterName,
//       "comic_id": comicId,
//       "published_date": publishedDate.toIso8601String(),
//       "description": description,
//       "status": status,
//       "type": type,
//       "comments": comments.map((e) => e.toJson()).toList(),
//       "chapter_images": chapterImages.map((e) => e.toJson()).toList(),
//     };
//   }
// }
