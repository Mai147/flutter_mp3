class SongModel {
  int id;
  String title;
  String? image;
  String author;
  String url;
  String? lyrics;

  SongModel(
      {required this.id,
      required this.title,
      this.image,
      required this.author,
      required this.url,
      this.lyrics});
}
