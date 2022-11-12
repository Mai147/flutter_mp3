class SongModel {
  String? id;
  String? name;
  String? image;
  String? audio;
  String? artist;
  int? like;
  int? views;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? country;
  String? originAlbum;
  List<String>? listAlbum;
  List<String>? listType;
  String? lyrics;
  bool? isNetworkSource;

  SongModel(
      {this.id,
      this.name,
      this.image,
      this.audio,
      this.artist,
      this.like,
      this.views,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.originAlbum,
      this.listAlbum,
      this.listType,
      this.lyrics,
      this.isNetworkSource = false});

  factory SongModel.fromJson(Map<String, dynamic> obj) {
    return SongModel(
        id: obj['_id'],
        name: obj['name'],
        image: obj['image'],
        audio: obj['audio'],
        artist: obj['artistId'],
        like: obj['like'],
        views: obj['views'],
        createdAt: DateTime.parse(obj['createdAt']),
        updatedAt: DateTime.parse(obj['updatedAt']),
        country: obj['country'],
        originAlbum: obj['originAlbumIds'],
        listAlbum: obj['listAlbumIds'],
        listType: obj['listType'],
        lyrics: obj['lyrics'],
        isNetworkSource: true);
  }
}
