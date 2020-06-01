class CityEntity {
  String name;
  String cityCode;
  String firstCharacter;

  CityEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cityCode = json['city_code'];
    firstCharacter = json['first_character'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['city_code'] = this.cityCode;
    data['first_character'] = this.firstCharacter;
    return data;
  }
}
