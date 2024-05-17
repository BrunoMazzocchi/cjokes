import 'package:jokes/features/jokes/domain/entities/joke_entity.dart';

class JokeModel extends JokeEntity {
  const JokeModel({required super.value, required super.url, required super.id, required super.iconUrl, required super.createdAt, required super.categories});


  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      categories: const [],
      createdAt: json['created_at'],
      iconUrl: json["icon_url"],
      id: json["id"],
      url: json["url"],
      value: json["value"],
    );
  }
}