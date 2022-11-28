class Game {
  int? id;
  String? slug;
  String? name;
  String? description;
  String? released;
  bool? tba;
  String? backgroundImage;
  String? website;
  double? rating;

  Game.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    slug = parsedJson["slug"];
    name = parsedJson["name"];
    description = parsedJson["description"];
    released = parsedJson["released"];
    tba = parsedJson["tba"];
    backgroundImage = parsedJson["background_image"];
    website = parsedJson["website"];
    rating = parsedJson["rating"];
  }
}