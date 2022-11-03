class SongApiModel {
  String id;
  String name;
  String image;
  String audio;
  String artist;
  int like;
  int view;
  DateTime createdAt;
  DateTime updatedAt;
  String country;
  String originAlbum;
  List<String> listAlbum;
  List<String> listType;

  SongApiModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.audio,
      required this.artist,
      required this.like,
      required this.view,
      required this.createdAt,
      required this.updatedAt,
      required this.country,
      required this.originAlbum,
      required this.listAlbum,
      required this.listType});

  factory SongApiModel.fromJson(Map<String, dynamic> obj) {
    return SongApiModel(
        id: obj['id'],
        name: obj['name'],
        image: obj['image'],
        audio: obj['audio'],
        artist: obj['artistId'],
        like: obj['like'],
        view: obj['view'],
        createdAt: DateTime.parse(obj['createdAt']),
        updatedAt: DateTime.parse(obj['updatedAt']),
        country: obj['country'],
        originAlbum: obj['originAlbumIds'],
        listAlbum: obj['listAlbumIds'],
        listType: obj['listType']);
  }
}
