
import 'package:equatable/equatable.dart';

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
  
  @override
  List<Object?> get props => [value, url, id, iconUrl, createdAt, categories];

}