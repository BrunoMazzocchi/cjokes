
import 'package:equatable/equatable.dart';
import 'package:jokes/features/jokes/data/models/joke_model.dart';

/// Class that represents the joke entity.
/// The content of the joke is the value field.
class JokeEntity extends Equatable {

  final String value;
  final String url;
  final String id;
  final String iconUrl;
  final String createdAt;
  final List<String> categories;

  const JokeEntity({
    required this.value,
    required this.url,
    required this.id,
    required this.iconUrl,
    required this.createdAt,
    required this.categories,
  });

  factory JokeEntity.fromModel(JokeModel model) {
    return JokeEntity(
      value: model.value,
      url: model.url,
      id: model.id,
      iconUrl: model.iconUrl,
      createdAt: model.createdAt,
      categories: model.categories,
    );
  }

  @override
  List<Object?> get props => [value, url, id, iconUrl, createdAt, categories];

}