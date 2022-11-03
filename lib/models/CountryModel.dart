class CountryModel {
  String id;
  String name;
  String flag;
  CountryModel({required this.id, required this.name, required this.flag});

  factory CountryModel.fromJson(Map<String, dynamic> obj) {
    return CountryModel(id: obj['id'], name: obj['name'], flag: obj['flag']);
  }
}
