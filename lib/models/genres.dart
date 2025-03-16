class Genre {
  final String genresId;
  final String genresName;
  final String? genresDescription;
  final int status;

  Genre({
    required this.genresId,
    required this.genresName,
    this.genresDescription,
    required this.status,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      genresId: json["genres_id"] ?? "",
      genresName: json["genres_name"] ?? "",
      genresDescription: json["genres_description"],
      status: json["status"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "genres_id": genresId,
      "genres_name": genresName,
      "genres_description": genresDescription,
      "status": status,
    };
  }
}
